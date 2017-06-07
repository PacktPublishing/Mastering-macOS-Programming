

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification)
    {
//        var b = true
//        var i = 24
//        let s = "Stop here a second..."
//        print(b, s, i)
//        b = false
//        i = 9
        
        
//        #if DEV
//            let kBaseURL = "http://staging-server.com/api/"
//        #else
//            // if this is missing, compiler won't catch it, but build will fail
//            let kBaseURL  = "http://production-server.com/api/"
//        #endif
//        print(kBaseURL)
        
        let args = ProcessInfo.processInfo.arguments
        let envVars = ProcessInfo.processInfo.environment
        
        if args.contains("MyLaunchArg")
        {
            print("MyLaunchArg is set")
        }
        if let myEnvVar = envVars["MyEnvironmentVariable"]
        {
            print("MyEnvironmentVariable = \(myEnvVar)")
        }
        //        print("ARGS:")
        //        print("ENV VARS:")
        
//        print("Function: \(#function)")
//        print("File: \(#file)")
//        print("Line: \(#line)")
//        print("Column: \(#column)")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

