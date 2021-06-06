import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_status_page/edit_status_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Align(
          alignment: Alignment(0, 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<UsersRecord> rowUsersRecordList = snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    // return Container();
                    // For now, we'll just include some dummy data.
                    rowUsersRecordList = createDummyUsersRecord(count: 1);
                  }
                  final rowUsersRecord = rowUsersRecordList.first;
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: rowUsersRecord.photoUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Text(
                                    rowUsersRecord.displayName,
                                    style: GoogleFonts.getFont(
                                      'Quicksand',
                                      color: Color(0xFF455A64),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(28, 16, 0, 16),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditStatusPageWidget(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(1, 0, 1, 0),
                                            child: Text(
                                              rowUsersRecord.mask.toString(),
                                              style: GoogleFonts.getFont(
                                                'Quicksand',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 6, 0, 0),
                                            child: Text(
                                              'Masks',
                                              style: GoogleFonts.getFont(
                                                'Quicksand',
                                                color: Color(0xFF90A4AE),
                                                fontSize: 11,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            rowUsersRecord.alcohol.toString(),
                                            style: GoogleFonts.getFont(
                                              'Quicksand',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 6, 0, 0),
                                            child: Text(
                                              'Alcohol',
                                              style: GoogleFonts.getFont(
                                                'Quicksand',
                                                color: Color(0xFF90A4AE),
                                                fontSize: 11,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          rowUsersRecord.food.toString(),
                                          style: GoogleFonts.getFont(
                                            'Quicksand',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 6, 0, 0),
                                          child: Text(
                                            'food',
                                            style: GoogleFonts.getFont(
                                              'Quicksand',
                                              color: Color(0xFF90A4AE),
                                              fontSize: 11,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 16, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.show_chart_rounded,
                          color: Color(0xFFFF5722),
                          size: 18,
                        ),
                        Text(
                          'Stay at home\n10 days',
                          style: GoogleFonts.getFont(
                            'Quicksand',
                            color: Color(0xFF455A64),
                            fontSize: 11,
                          ),
                        )
                      ],
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Add friend',
                      options: FFButtonOptions(
                        width: 110,
                        height: 30,
                        color: Color(0xFF88C17D),
                        textStyle: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: 28,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 10,
                decoration: BoxDecoration(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: FlutterFlowTheme.primaryColor,
                          indicatorColor: FlutterFlowTheme.secondaryColor,
                          tabs: [
                            Tab(
                              text: 'Recent Pings',
                              icon: Icon(
                                Icons.comment_rounded,
                              ),
                            ),
                            Tab(
                              text: 'Friends',
                              icon: Icon(
                                Icons.people_rounded,
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              StreamBuilder<List<PingsRecord>>(
                                stream: queryPingsRecord(
                                  queryBuilder: (pingsRecord) => pingsRecord
                                      .where('user',
                                          isEqualTo: currentUserReference)
                                      .orderBy('update_timestamp',
                                          descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  List<PingsRecord> listFriendPingsRecordList =
                                      snapshot.data;
                                  // Customize what your widget looks like with no query results.
                                  if (snapshot.data.isEmpty) {
                                    // return Container();
                                    // For now, we'll just include some dummy data.
                                    listFriendPingsRecordList =
                                        createDummyPingsRecord(count: 4);
                                  }
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                        listFriendPingsRecordList.length,
                                        (listFriendIndex) {
                                      final listFriendPingsRecord =
                                          listFriendPingsRecordList[
                                              listFriendIndex];
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.tertiaryColor,
                                          border: Border.all(
                                            color: Color(0xFFC8CED5),
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 0, 8, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      listFriendPingsRecord
                                                          .friendPhotoUrl,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listFriendPingsRecord
                                                        .friendName,
                                                    style: FlutterFlowTheme
                                                        .subtitle1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF15212B),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 4, 4, 0),
                                                          child: Text(
                                                            'How are you doing?',
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText2
                                                                    .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: FlutterFlowTheme
                                                                  .primaryColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    onPressed: () async {
                                                      final isPinged = false;

                                                      final pingsRecordData =
                                                          createPingsRecordData(
                                                        isPinged: isPinged,
                                                      );

                                                      await listFriendPingsRecord
                                                          .reference
                                                          .update(
                                                              pingsRecordData);
                                                      final email = '';

                                                      final usersRecordData =
                                                          createUsersRecordData(
                                                        email: email,
                                                      );

                                                      await listFriendPingsRecord
                                                          .friend
                                                          .update(
                                                              usersRecordData);
                                                    },
                                                    icon: Icon(
                                                      Icons.reply,
                                                      color: FlutterFlowTheme
                                                          .primaryColor,
                                                      size: 30,
                                                    ),
                                                    iconSize: 30,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                              StreamBuilder<List<PingsRecord>>(
                                stream: queryPingsRecord(
                                  queryBuilder: (pingsRecord) => pingsRecord
                                      .where('user',
                                          isEqualTo: currentUserReference)
                                      .orderBy('update_timestamp',
                                          descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  List<PingsRecord> listFriendPingsRecordList =
                                      snapshot.data;
                                  // Customize what your widget looks like with no query results.
                                  if (snapshot.data.isEmpty) {
                                    // return Container();
                                    // For now, we'll just include some dummy data.
                                    listFriendPingsRecordList =
                                        createDummyPingsRecord(count: 4);
                                  }
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                        listFriendPingsRecordList.length,
                                        (listFriendIndex) {
                                      final listFriendPingsRecord =
                                          listFriendPingsRecordList[
                                              listFriendIndex];
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.tertiaryColor,
                                          border: Border.all(
                                            color: Color(0xFFC8CED5),
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 0, 8, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      listFriendPingsRecord
                                                          .friendPhotoUrl,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    listFriendPingsRecord
                                                        .friendName,
                                                    style: FlutterFlowTheme
                                                        .subtitle1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF15212B),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 4, 4, 0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'relative',
                                                            listFriendPingsRecord
                                                                .updateTimestamp
                                                                .toDate()),
                                                        style: FlutterFlowTheme
                                                            .bodyText2
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 4, 4, 0),
                                                          child: Text(
                                                            listFriendPingsRecord
                                                                .friendLastMask
                                                                .toString(),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText2
                                                                    .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: FlutterFlowTheme
                                                                  .primaryColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 4, 4, 0),
                                                          child: Text(
                                                            listFriendPingsRecord
                                                                .friendLastAlcohol
                                                                .toString(),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText2
                                                                    .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: FlutterFlowTheme
                                                                  .primaryColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 4, 4, 0),
                                                          child: Text(
                                                            listFriendPingsRecord
                                                                .friendLastFood
                                                                .toString(),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText2
                                                                    .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: FlutterFlowTheme
                                                                  .primaryColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ToggleIcon(
                                                    onPressed: () async {
                                                      final hasPingedFriend =
                                                          !listFriendPingsRecord
                                                              .hasPingedFriend;

                                                      final pingsRecordData =
                                                          createPingsRecordData(
                                                        hasPingedFriend:
                                                            hasPingedFriend,
                                                      );

                                                      await listFriendPingsRecord
                                                          .reference
                                                          .update(
                                                              pingsRecordData);
                                                    },
                                                    value: listFriendPingsRecord
                                                        .hasPingedFriend,
                                                    onIcon: Icon(
                                                      Icons.soap_outlined,
                                                      color: FlutterFlowTheme
                                                          .secondaryColor,
                                                      size: 25,
                                                    ),
                                                    offIcon: Icon(
                                                      Icons.soap_rounded,
                                                      color: FlutterFlowTheme
                                                          .secondaryColor,
                                                      size: 25,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
