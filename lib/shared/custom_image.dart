import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_manar_app/core/utils/size_config.dart';

class CustomImage extends StatelessWidget {
  final double? width, height;
  final String? imageFilePath;
  final Color? color;
  final bool circleShape;
  final BoxFit? fit;
  final double? iconSize;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  const CustomImage({
    super.key,
    this.width,
    this.height,
    this.imageFilePath,
    this.color,
    this.circleShape = false,
    this.fit,
    this.borderRadius,
    this.iconSize,
    this.padding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeConfig.defaultSize * 10,
      height: height ?? SizeConfig.defaultSize * 10,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        borderRadius: !circleShape ? borderRadius : null,
        shape: circleShape ? BoxShape.circle : BoxShape.rectangle,
        image: imageFilePath != null
            ? DecorationImage(
                image: FileImage(File(imageFilePath!)),
                fit: fit,
              )
            : null,
      ),
      child: imageFilePath == null
          ? Icon(
              Icons.person,
              size: iconSize ?? SizeConfig.defaultSize * 7,
              color: Colors.grey.shade300,
            )
          : null,
    );
  }
}

class CustomNetworkImage extends StatelessWidget {
  final double? width, height;
  final String? imageUrl;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool circleShape;
  final BoxFit? fit;
  final double? borderRadius;
  final double? iconSize;
  final bool withBorder;
  final Color? borderColor;
  final AlignmentGeometry? alignment;
  const CustomNetworkImage({
    super.key,
    this.width,
    this.height,
    this.imageUrl,
    this.color,
    this.margin,
    this.padding,
    this.circleShape = false,
    this.fit,
    this.borderRadius,
    this.iconSize,
    this.withBorder = false,
    this.borderColor,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeConfig.defaultSize * 10,
      height: height ?? SizeConfig.defaultSize * 10,
      alignment: alignment,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: withBorder
            ? Border.all(
                color: borderColor ?? Colors.grey.withOpacity(.3),
              )
            : null,
        borderRadius:
            !circleShape ? BorderRadius.circular(borderRadius ?? 20) : null,
        color: color ?? Colors.transparent,
        shape: circleShape ? BoxShape.circle : BoxShape.rectangle,
        image: imageUrl != 'default'
            ? DecorationImage(
                fit: fit,
                image: CachedNetworkImageProvider(
                  'http://taskflutter.futurecode-projects.com/${imageUrl!}',
                ),
              )
            : null,
      ),
      child: imageUrl == 'default'
          ? Icon(
              Icons.person,
              size: iconSize ?? SizeConfig.defaultSize * 9,
              color: Colors.black,
            )
          : null,
    );
  }
}
