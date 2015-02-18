package main

import "errors"
import ol "mobile.ooyala.com/common/log"
import gl "log"
import "log"
import args "mobile.ooyala.com/common/args/parse"
import "mobile.ooyala.com/common/util"
import . "mobile.ooyala.com/common/path"
import vc "mobile.ooyala.com/samples/config/vendor_config"
import zc "mobile.ooyala.com/samples/config/zip_config"

func run(fn func() error, l *gl.Logger) {
	err := fn()
	if err != nil {
		util.Die(err, l)
	}
}

func loadFlags(l *gl.Logger) (args.Config, error) {
	c := args.MakeConfig(l)
	err := args.ParseArgs(c, l)
	return c, err
}

func main() {
	l, err := ol.NewFileAndStdoutLoggerNow(MakeFileAbs("/tmp/ios-sample-apps.update_from_target_location"))
	ol.ColorizedPrintln(l, "ios update from target location")
	util.MaybeDie(err, nil)

	rootDir, err := util.ToDirAbs(MakeDirRel("."))
	util.MaybeDie(err, l)

	config := vc.MakeiOSConfig(rootDir, l);
	zipConfig := zc.MakeiOSConfig(rootDir, l);

	var configArgs args.Config
	run(func() error { var err error; configArgs, err = loadFlags(l); return err }, l)

	sdkFolderPath := *configArgs.Path

	if sdkFolderPath == "" {
		util.Die(errors.New("ERROR: no path passed in"), l)
	}

	checkSdkExist(sdkFolderPath, zipConfig, l)

	removeOldOoyalaVendorFolders(config, l)

	copyFromTargetFolders(config, zipConfig, sdkFolderPath, l)

	unzipNewRCPackages(config, zipConfig, l)

	removeZipFiles(config, zipConfig, l)

	//TEMPORARY: Remove all sample apps provided in the packages, until the sample apps are no longer included
	util.DeletePath(MakeFileAbs(Join(config.VendorOoyalaCoreFolderPath, MakeFileName("SampleApps"))), l);
	util.DeletePath(MakeFileAbs(Join(config.VendorOoyalaCoreFolderPath, MakeFileName("APIDocs"))), l);
	util.DeletePath(MakeFileAbs(Join(config.VendorOoyalaFreewheelFolderPath, MakeFileName("FreewheelSampleApp"))), l);
	util.DeletePath(MakeFileAbs(Join(config.VendorOoyalaFreewheelFolderPath, MakeFileName("APIDocs"))), l);
	util.DeletePath(MakeFileAbs(Join(config.VendorOoyalaIMAFolderPath,MakeFileName("IMASampleApp"))), l);
	util.DeletePath(MakeFileAbs(Join(config.VendorOoyalaIMAFolderPath, MakeFileName("APIDocs"))), l);
}

func removeOldOoyalaVendorFolders(config vc.Config, l *log.Logger) {
	ol.ColorizedMethodPrintln(l)
		util.DeletePath(config.VendorOoyalaFreewheelFolderPath, l);
		util.DeletePath(config.VendorOoyalaCoreFolderPath, l);
		util.DeletePath(config.VendorOoyalaIMAFolderPath, l);
}

func copyFromTargetFolders(config vc.Config, zipConfig zc.Config, sdkFolderPath string, l *log.Logger) {
	ol.ColorizedMethodPrintln(l)

	err := util.RunBashCommandsInDir(config.VendorOoyalaRootFolderPath, []string{"cp " + sdkFolderPath + zipConfig.CoreSDKFileNameStr + " " + zipConfig.CoreSDKFileNameStr}, l)
	util.MaybeDie(err, l)

	err = util.RunBashCommandsInDir(config.VendorOoyalaRootFolderPath, []string{"cp " + sdkFolderPath + zipConfig.FreewheelSDKFileNameStr +  " " + zipConfig.FreewheelSDKFileNameStr}, l)
	util.MaybeDie(err, l)

	err = util.RunBashCommandsInDir(config.VendorOoyalaRootFolderPath, []string{"cp " + sdkFolderPath + zipConfig.IMASDKFileNameStr + " " + zipConfig.IMASDKFileNameStr}, l)
	util.MaybeDie(err, l)
}


func unzipNewRCPackages(config vc.Config, zipConfig zc.Config, l *log.Logger) {
	ol.ColorizedMethodPrintln(l)
	err := util.RunBashCommandsInDir(config.VendorOoyalaRootFolderPath, []string{"unzip -o " + zipConfig.CoreSDKFileNameStr}, l)
	util.MaybeDie(err, l)

	err = util.RunBashCommandsInDir(config.VendorOoyalaRootFolderPath, []string{"unzip -o " + zipConfig.FreewheelSDKFileNameStr}, l)
	util.MaybeDie(err, l)

	err = util.RunBashCommandsInDir(config.VendorOoyalaRootFolderPath, []string{"unzip -o " + zipConfig.IMASDKFileNameStr}, l)
	util.MaybeDie(err, l)
}

func removeZipFiles(config vc.Config, zipConfig zc.Config, l *log.Logger) {
	ol.ColorizedMethodPrintln(l)
	err := util.RunBashCommandsInDir(config.VendorOoyalaRootFolderPath, []string{"rm " + zipConfig.CoreSDKFileNameStr}, l)
	util.MaybeDie(err, l)

	err = util.RunBashCommandsInDir(config.VendorOoyalaRootFolderPath, []string{"rm " + zipConfig.FreewheelSDKFileNameStr}, l)
	util.MaybeDie(err, l)

	err = util.RunBashCommandsInDir(config.VendorOoyalaRootFolderPath, []string{"rm " + zipConfig.IMASDKFileNameStr}, l)
	util.MaybeDie(err, l)
}

func checkSdkExist(sdkFolderPathStr string, zipConfig zc.Config, l *log.Logger) {
     CoreSDKPath := MakeFileAbs(sdkFolderPathStr + zipConfig.CoreSDKFileNameStr)
     FreewheelSDKPath := MakeFileAbs(sdkFolderPathStr + zipConfig.FreewheelSDKFileNameStr)
     IMASDKPath := MakeFileAbs(sdkFolderPathStr + zipConfig.IMASDKFileNameStr)

     sdkPaths := []Pather{CoreSDKPath, FreewheelSDKPath, IMASDKPath}

     run( func() error { var err error; err = util.RequirePaths(sdkPaths, l); return err }, l)
 }