
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logic_study_app/controller/collage_controller.dart';
import 'package:logic_study_app/model/video.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({super.key, required this.videos});
  final List videos;
  
  

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool _isLoading = true;
  bool _isError = false;
    List<Video>? _res;
  late VideoPlayerController _controller;
  double _currentPosition = 0.0;
  bool _showControls = true;
  Timer? _hideControlsTimer;

  @override
  void initState() {
    super.initState();
    Provider.of<CollageController>(context, listen:  false).getVideos(videos: widget.videos).then((value) {
      setState(() {
        _isLoading = false;
        _res = value;
      });
   try {
     
    _controller = VideoPlayerController.networkUrl(Uri.parse(value![0].videoUrl));
   
    _controller.initialize().then((_) {
      print( 'init');
      setState(() {});
      _controller.play();
    });
    _controller.addListener(() {
      setState(() {
        _currentPosition = _controller.value.position.inMilliseconds.toDouble();
      });
      // Start the timer to hide controls when the video starts playing
      if (_controller.value.isPlaying && _showControls) {
        _startHideControlsTimer();
      }
    });
   } catch (e) {
     print(e);
        }
    }).catchError((e){
      print(e);
      setState(() {
        _isError = true;
      });
    });
  }

  @override
  void dispose() {
    _hideControlsTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    if (_controller.value.isPlaying) {
      _hideControlsTimer = Timer(Duration(seconds: 2), () {
        setState(() {
          _showControls = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      backgroundColor: Color(0xffefeff4),
      body: _isLoading|| _res == null? Center(child: CircularProgressIndicator(),) : _isError? Center(child: Text('حصل خطأ ما'),) :SafeArea(
        child: Column(
          children: [
            // Video player
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: _controller.value.isInitialized
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _showControls = !_showControls;
                        });
                        if (_controller.value.isPlaying && _showControls) {
                          _startHideControlsTimer();
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          VideoPlayer(_controller),
                          if (_showControls) _buildControls(),
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
              height: 2,
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                textDirection: TextDirection.ltr,
                 _res![0].title,
                style: TextStyle(fontSize: 20, fontFamily: "Omnes Bold"),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    textDirection: TextDirection.ltr,
                    'الاستاذ : علي محمد راضي  ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  Text(textDirection: TextDirection.ltr, '')
                ],
              ),
            ),
            Divider(
              color: Color.fromARGB(106, 161, 160, 160),
              height: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.end,
                  "الوصف",
                  style: TextStyle(fontSize: 14, fontFamily: "Omnes Bold"),
                ),
                DescriptionTextWidget(
                  text:
                      _res![0].desc,
                ),
                Divider(
                  color: Color.fromARGB(97, 161, 160, 160),
                  height: 10,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _res!.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 6, top: 8),
                          width: 500,
                          height: 106,
                          child: GestureDetector(
                            onTap: () {
                              _controller.pause();
                              _controller = VideoPlayerController.networkUrl(
                                  Uri.parse(_res![index].videoUrl));
                              _controller.initialize().then((_) {
                                setState(() {});
                                _controller.play();
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.3,
                                  height: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(fit: BoxFit.fitHeight,
                                      image: NetworkImage(_res![index].image, ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 28.0, bottom: 2),
                                        child: Text(
                                         _res![index].title,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Omnes Bold"),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 64.0),
                                        child: Text(
                                         _res![index].desc,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'سنة مضت',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text('1'),
                                            SizedBox(
                                              width: 70,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1.5,
                                                    color: const Color.fromARGB(
                                                        255, 7, 7, 7)),
                                              ),
                                              height: 20,
                                              width: 50,
                                              child: Text(
                                                '   مجاني',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return AnimatedOpacity(
      opacity: _showControls ? 1.0 : 0.0,
      duration: Duration(milliseconds: 300),
      child: Column(
        children: [
          SizedBox(
            height: 215,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(214, 255, 255, 255),
                    ),
                    overlayColor: MaterialStatePropertyAll<Color>(
                        const Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(167, 139, 139, 139)),
                  ),
                  icon: Icon(
                    Icons.skip_previous,
                    size: 30,
                  ),
                  onPressed: () {
                    _controller.seekTo(
                        _controller.value.position - Duration(seconds: 10));
                  },
                ),
                IconButton(
                  style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(214, 255, 255, 255),
                    ),
                    overlayColor: MaterialStatePropertyAll<Color>(
                        const Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(167, 139, 139, 139)),
                  ),
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 50,
                  ),
                  onPressed: () {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  },
                ),
                IconButton(
                  style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(214, 255, 255, 255),
                    ),
                    overlayColor: MaterialStatePropertyAll<Color>(
                        const Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(167, 139, 139, 139)),
                  ),
                  icon: Icon(
                    Icons.skip_next,
                    size: 30,
                  ),
                  onPressed: () {
                    _controller.seekTo(
                        _controller.value.position + Duration(seconds: 10));
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Slider(
              activeColor: Colors.blue,
              value: _currentPosition,
              onChanged: (double value) {
                setState(() {
                  _currentPosition = value;
                  _controller
                      .seekTo(Duration(milliseconds: _currentPosition.toInt()));
                });
              },
              min: 0.0,
              max: _controller.value.duration.inMilliseconds.toDouble(),
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
            )
          : Column(
              children: <Widget>[
                Text(
                    style: TextStyle(color: Color.fromARGB(255, 122, 122, 122)),
                    flag ? ("$firstHalf...") : (firstHalf + secondHalf)),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? "... عرض المزيد" : " عرض أقل ",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
