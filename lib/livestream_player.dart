import 'package:flutter/material.dart';

class LivestreamPlayer extends StatefulWidget {
  final String downstreamUrl;
  const LivestreamPlayer({
    Key? key,
    required this.downstreamUrl,
  }) : super(key: key);

  @override
  LivestreamPlayerState createState() => LivestreamPlayerState();
}

class LivestreamPlayerState extends State<LivestreamPlayer>
    with AutomaticKeepAliveClientMixin {
  late VlcPlayerController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    //initializing the player
    _controller = VlcPlayerController.network(widget.downstreamUrl,
        options: VlcPlayerOptions());
  }

  @override
  void dispose() async {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //rendering the VlcPlayer
    return VlcPlayer(
      controller: _controller,
      aspectRatio: 9 / 16,
      placeholder: const Center(child: CircularProgressIndicator()),
    );
  }
}
