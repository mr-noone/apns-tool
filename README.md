# apns-tool

```
Usage:

    $ ./apns <key_path> <key_id> <team_id> <app_id> <token>

Arguments:

    key_path  - APNs key file path
    key_id    - APNs key identifier
    team_id   - Team identifier
    app_id    - App bundle identifier
    token     - Device token

Options:
    --prod   [default: false]    - Production environment
    --title  [default: Test]     - Notification title
    --body   [default: Test]     - Notification body
    --sound  [default: default]  - Notification sound name
    --badge  [default: 0]        - Notification badge number
    --key    [default: []]       - Custom payload keys
    --value  [default: []]       - Custom payload values
```
