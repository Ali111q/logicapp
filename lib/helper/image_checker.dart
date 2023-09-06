import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:logic_study_app/helper/loading.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class NetworkImageChecker extends StatefulWidget {
  final String imageUrl;
  bool imageLoaded = false;
  BoxFit? fit = BoxFit.contain;
  double? width;
  double? height;
  NetworkImageChecker(
      {required this.imageUrl, this.fit, this.height, this.width});

  @override
  _NetworkImageCheckerState createState() => _NetworkImageCheckerState();
}

class _NetworkImageCheckerState extends State<NetworkImageChecker> {
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _checkImageStatus();
  }

  void _checkImageStatus() {
    final customCacheManager = CacheManager(
      Config(
        'customCacheKey',
        stalePeriod: const Duration(days: 3),
        maxNrOfCacheObjects: 100,
      ),
    );

    final imageProvider = CachedNetworkImageProvider(
      widget.imageUrl,
      cacheManager: customCacheManager,
    );
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);
    imageStream.addListener(
      ImageStreamListener(
        (imageInfo, _) {
          if (mounted) {
            setState(() {
              _isLoading = false;
              widget.imageLoaded = true;
              _isError = false;
            });
          }
        },
        onError: (_, __) {
          if (mounted) {
            setState(() {
              _isLoading = false;
              widget.imageLoaded = false;
              _isError = true;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Loading();
    } else if (_isError) {
      return Loading();
    } else {
      return CachedNetworkImage(
        imageUrl: widget.imageUrl,
        fit: widget.fit,
        width: widget.width,
        height: widget.height,
      );
    }
  }
}
