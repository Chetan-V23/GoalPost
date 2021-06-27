import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MatchTile extends StatefulWidget {
  const MatchTile({Key? key, required this.match}) : super(key: key);
  final dynamic match;
  @override
  _MatchTileState createState() => _MatchTileState();
}

class _MatchTileState extends State<MatchTile>
    with AutomaticKeepAliveClientMixin {
  DateTime? matchDate;
  String? day;
  @override
  void initState() {
    matchDate = DateTime.parse(widget.match['fixture']['date']);
    day = DateFormat('EEEE').format(matchDate!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.match['league']['name'],
                  style: TextStyle(color: Colors.blue[800], fontSize: 10),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 12),
                alignment: Alignment.centerRight,
                child: Text(
                  "$day  ${matchDate!.month}/${matchDate!.day}   ${matchDate!.hour}:${matchDate!.minute}",
                  style: TextStyle(color: Colors.blue[800], fontSize: 15),
                ),
              )
            ],
          ),
          Stack(
            alignment: FractionalOffset.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TeamIcon(
                imgSrc: widget.match['teams']['home']['logo'],
                name: widget.match['teams']['home']['name'],
                leftOrRight: true,
              ),
              widget.match['fixture']['status']['short'] == "NS"
                  ? Center(
                      child: Text(
                        "-- - --",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    )
                  : Center(
                      child: Text(
                        widget.match['goals']['home'].toString() +
                            ' - ' +
                            widget.match['goals']['away'].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
              TeamIcon(
                imgSrc: widget.match['teams']['away']['logo'],
                name: widget.match['teams']['away']['name'],
                leftOrRight: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TeamIcon extends StatelessWidget {
  const TeamIcon({
    Key? key,
    required this.imgSrc,
    required this.name,
    required this.leftOrRight,
  }) : super(key: key);

  final String imgSrc;
  final String name;
  final bool leftOrRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Align(
        alignment: leftOrRight ? Alignment.centerLeft : Alignment.centerRight,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment:
              leftOrRight ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Image.network(
              imgSrc,
              height: 50,
              width: 50,
              semanticLabel: name,
            ),
            Container(
              height: 20,
              width: 60,
              child: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 15),
                textAlign: leftOrRight ? TextAlign.start : TextAlign.end,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
