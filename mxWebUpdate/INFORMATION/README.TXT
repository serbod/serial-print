*******************************************************

 TmxWebUpdate for Delphi 5,6,7,2005,2006,2007,2009
 Copyright (c) 2002-2008 Bitvadász Kft.

*******************************************************

 Contact :
 ---------
 
  E-Mail: support@maxcomponents.net

 To get more information on  my component please have a 
 look at  the my Web Site which can be found on the Net
 at http://www.maxcomponents.net

 You  can find there updates, help files and the latest 
 information about known problems.

*******************************************************

 Overview :
 ----------

 TmxWebUpdate helps you to add automatic update support 
 to your application. It retrieves information from the 
 web, if a newer version available, it can download a 
 file via HTTP and run the update.
 
*******************************************************

 Important :

 This component uses Microsoft Windows Internet Library, 
 so you must have installed WININET.DLL on the client 
 computer.

*******************************************************
 
 How to install :
 ----------------

 Delphi 5:
 
 Open mxWebUpdate_d5.dpk project file, compile and install it.
 Now TmxWebUpdate will  be available in Max Palette.

 Delphi 6:
 
 Open mxWebUpdate_d6.dpk project file, compile and install it.
 Now TmxWebUpdate will  be available in Max Palette.

 Delphi 7:
 
 Open mxWebUpdate_d7.dpk project file, compile and install it.
 Now TmxWebUpdate will  be available in Max Palette.

 Delphi 2005:
 
 Open mxWebUpdate_d9.dpk project file, compile and install it.
 Now TmxWebUpdate will  be available in Max Palette.

 Delphi 2006:
 
 Open mxWebUpdate_d10.dpk project file, compile and install it.
 Now TmxWebUpdate will  be available in Max Palette.

 Delphi 2007:
 
 Open mxWebUpdate_d11.dpk project file, compile and install it.
 Now TmxWebUpdate will  be available in Max Palette.

 Delphi 2008:
 
 Open mxWebUpdate_d12.dpk project file, compile and install it.
 Now TmxWebUpdate will  be available in Max Palette.

*******************************************************

 How to use:
 -----------

 Published Properties:
 ---------------------

 Password, UserName : Set these properties if you trying to 
                      get data from password protected    
                      folders.

 Taginfo : It allows you to specify the names of each
 	   tag in update information file. You can
           find sample files in the Information folder.

 Taginfo.Author		: Name of author
 Taginfo.ClientFileName	: Name of update file on client side
 Taginfo.Download	: Download URL of update file
 Taginfo.Email		: Name of author's email address
 Taginfo.Product		: Name of product
 Taginfo.Redirection	: If it is specified the component 
                          downloads information file from this 
                          URL. 
 Taginfo.RunParameters	: Parameters will be used for execution 
                          of downloaded update.
 Taginfo.Version	: Version of update

 ProductInfo : Information of existing product

 ProductInfo.URL	: Update info URL
 ProductInfo.Version : Version of your existing application

 ProductInfo.VersionFormat : 

  	vfNumber - Compares two numbers
	vfString - Compares two strings 
	vfStandard - Compares two version numbers.

 Options	: 

	uoRunUpdate - Executes the update after download.	  
 	UoTerminate - Terminates the application after 
                      download.
	UoOverwrite - Overwrite the file at client side if 
                      it is exists.

 InfoCaption : Use this to translate captions of info window.

 Public Properties:
 ------------------

 Active	: It is true during update

 You can use following read-only properties after download 
 information file:

 * ProductVersion		
 * UpdateURL		
 * ClientFileName		
 * RedirectionURL		
 * Author		
 * Email		
 * ProductName		
 * RunParameters		

 Methods:
 --------

 CheckForAnUpdate : Get the update from the web specified in 
                    the URL
 Abort : You can stop the update any time.

 Events:
 -------

 OnBeforeGetInfo: Occurs before checking for an update
 OnAfterGetInfo: Occurs when information is available

 OnBeforeShowInfo: Occurs before show information
 OnAfterShowInfo: Occurs after information has shown.

 OnBeforeDownload: Occurs when the file begins to download
 OnAfterDownload: Occurs when the file is downloaded

 OnUpdateAvailable: Occurs when update is available
 OnNoUpdateFound: Occurs when update is not available

 OnGetClientFileName: Occurs when component needs client file name
 OnClientFileExists: Occurs when client file does exist.

 OnDownload: Occurs at receiving data from the web
 OnDownloadError: Occurs when error happend
 OnCannotExecute: Occurs when component cannot execute update

 If you need more information please have a look at 
 the demonstration application.
 
*******************************************************

 Enjoy It.

*******************************************************
