//
//  StartupUtils.swift
//  SampleAppAPI
//
//  Created by Cindy Michalowski on 2/7/24.
//

struct StartupUtils {
    static func shouldRunLocal() -> Bool {
        return CommandLine.arguments.contains("-runlocal")
    }
}
