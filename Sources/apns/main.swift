import Foundation
import Commander
import PerfectNotifications

let command = Commander.command(
  Argument<String>("key_path", description: "APNs key file path"),
  Argument<String>("key_id", description: "APNs key identifier"),
  Argument<String>("team_id", description: "Team identifier"),
  Argument<String>("app_id", description: "App bundle identifier"),
  Argument<String>("token", description: "Device token"),
  Flag("prod", description: "Production environment"),
  Option("title", default: "Test", description: "Notification title"),
  Option("body", default: "Test", description: "Notification body"),
  Option("sound", default: "default", description: "Notification sound name"),
  Option("badge", default: 0, description: "Notification badge number"),
  VariadicOption("key", default: [String](), description: "Custom payload keys"),
  VariadicOption("value", default: [String](), description: "Custom payload values")
) { keyPath, keyId, teamId, appId, token, isProd, title, body, sound, badge, cKeys, cValues in
  NotificationPusher.addConfigurationAPNS(
    name: appId,
    production: isProd,
    keyId: keyId,
    teamId: teamId,
    privateKeyPath: keyPath
  )
  
  var items: [APNSNotificationItem] = [
    .alertTitle(title),
    .alertBody(body),
    .badge(badge),
    .sound(sound)
  ]
  
  guard cKeys.count == cValues.count else {
    print("Custom keys count must be equal to values count")
    exit(EXIT_FAILURE)
  }
  
  for i in 0..<cKeys.count {
    items.append(.customPayload(cKeys[i], cValues[i]))
  }
  
  NotificationPusher(apnsTopic: appId).pushAPNS(
    configurationName: appId,
    deviceToken: token,
    notificationItems: items,
    callback: {
      print($0)
      exit(EXIT_SUCCESS)
  })
}

do {
  var args = CommandLine.arguments
  args.removeFirst()
  try command.run(args)
} catch {
  print(error)
  exit(EXIT_FAILURE)
}

RunLoop.current.run()
