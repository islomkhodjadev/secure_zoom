import "package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart";
import "package:zoom/resources/auth_methods.dart";

class JitsiMeetMethods {
  final AuthMethods _authmethods = AuthMethods();

  void createMeeting(
      {required String roomname,
      required bool isAudioMuted,
      required bool isVideoMuted}) async {
    var options = JitsiMeetingOptions(
      roomNameOrUrl: roomname,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      userDisplayName: _authmethods.user.displayName,
      userEmail: _authmethods.user.email,
    );
    try {
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
