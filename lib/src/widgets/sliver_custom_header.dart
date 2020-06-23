import 'package:flutter/material.dart';

class SliverCustomHeader extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverCustomHeader({@required this.minHeight,@required this.maxHeight,@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: this.child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => (this.minHeight > this.maxHeight)? this.minHeight : this.maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => (this.minHeight < this.maxHeight)? this.minHeight : this.maxHeight;

  @override
  bool shouldRebuild(SliverCustomHeader oldDelegate) {
    return (this.minHeight != oldDelegate.minHeight) ||
           (this.maxHeight != oldDelegate.maxHeight) ||
           (this.child     != oldDelegate.child);
  }
  

 
}
