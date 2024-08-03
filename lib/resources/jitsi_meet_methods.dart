import "package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart";
import "package:zoom/resources/auth_methods.dart";
import "package:zoom/resources/firestore_methods.dart";

class JitsiMeetMethods {
  final AuthMethods _authmethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  void createMeeting(
      {required String roomname,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String userName = ""}) async {
    if (userName.isEmpty) {
      userName = _authmethods.user.displayName as String;
    }
    var options = JitsiMeetingOptions(
      roomNameOrUrl: roomname,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      userDisplayName: userName,
      userEmail: _authmethods.user.email,
      serverUrl: "https://jitsi1.geeksec.de",
      featureFlags: {
        'prejoinPageEnabled': false, // Disable pre-join page
        'inviteEnabled': false, // Disable the invite button
        'meeting-password.enabled':
            false, // Disable the meeting password option
        'lobby.enabled': false, // Disable the lobby feature
        'requireDisplayName': false, // Ensure display name is not required
        'welcomepage.enabled': false, // Disable welcome page
      },
      configOverrides: {
        'prejoinPageEnabled': false, // Ensure pre-join page is disabled
        'lobbyEnabled': false, // Ensure lobby is disabled
      },
    );
    try {
      _firestoreMethods.addMeetingHistory(roomname);
      await JitsiMeetWrapper.joinMeeting(
        options: options,
        listener: JitsiMeetingListener(
          onConferenceWillJoin: (url) =>
              print("onConferenceWillJoin: url: $url"),
          onConferenceJoined: (url) => print("onConferenceJoined: url: $url"),
          onConferenceTerminated: (url, error) =>
              print("onConferenceTerminated: url: $url, error: $error"),
        ),
      );
    } catch (e) {}
  }
}
