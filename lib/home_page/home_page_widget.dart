import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_status_page/edit_status_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
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
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final homePageUsersRecord = snapshot.data;
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
                  Padding(
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
                                  child: Image.network(
                                    homePageUsersRecord.photoUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Text(
                                    homePageUsersRecord.displayName,
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
                                              homePageUsersRecord.mask
                                                  .toString(),
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
                                                fontSize: 16,
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
                                            homePageUsersRecord.alcohol
                                                .toString(),
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
                                                fontSize: 16,
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
                                          homePageUsersRecord.food.toString(),
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
                                              fontSize: 16,
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
                          onPressed: () async {
                            await signOut();
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPageWidget(),
                              ),
                              (r) => false,
                            );
                          },
                          text: 'Logout',
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
                                          .where('receiver',
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
                                      List<PingsRecord>
                                          listViewPingsRecordList =
                                          snapshot.data;
                                      // Customize what your widget looks like with no query results.
                                      if (snapshot.data.isEmpty) {
                                        // return Container();
                                        // For now, we'll just include some dummy data.
                                        listViewPingsRecordList =
                                            createDummyPingsRecord(count: 4);
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewPingsRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewPingsRecord =
                                              listViewPingsRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                16, 0, 16, 1),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme
                                                    .tertiaryColor,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
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
                                                      listViewPingsRecord
                                                          .friendPhotoUrl,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            16, 1, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewPingsRecord
                                                              .friendName,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        Text(
                                                          'How are you doing?',
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText2
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      await listViewPingsRecord
                                                          .reference
                                                          .delete();
                                                    },
                                                    child: Icon(
                                                      Icons.reply,
                                                      color: FlutterFlowTheme
                                                          .primaryColor,
                                                      size: 24,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  StreamBuilder<List<StatusRecord>>(
                                    stream: queryStatusRecord(
                                      queryBuilder: (statusRecord) =>
                                          statusRecord
                                              .where('user',
                                                  isEqualTo:
                                                      currentUserReference)
                                              .orderBy('update_timestamp',
                                                  descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      List<StatusRecord>
                                          listViewStatusRecordList =
                                          snapshot.data;
                                      // Customize what your widget looks like with no query results.
                                      if (snapshot.data.isEmpty) {
                                        // return Container();
                                        // For now, we'll just include some dummy data.
                                        listViewStatusRecordList =
                                            createDummyStatusRecord(count: 4);
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewStatusRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewStatusRecord =
                                              listViewStatusRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                16, 0, 16, 1),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme
                                                    .tertiaryColor,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
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
                                                      listViewStatusRecord
                                                          .friendPhotoUrl,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            16, 1, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          16,
                                                                          0),
                                                              child: Text(
                                                                listViewStatusRecord
                                                                    .friendName,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  listViewStatusRecord
                                                                      .updateTimestamp
                                                                      .toDate()),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .bodyText2
                                                                      .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0x851A1A1A),
                                                                fontSize: 10,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Mask: ',
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        10,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          8,
                                                                          0),
                                                                  child: Text(
                                                                    listViewStatusRecord
                                                                        .friendLastMask
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme
                                                                          .secondaryColor,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Alcohol: ',
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        10,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          8,
                                                                          0),
                                                                  child: Text(
                                                                    listViewStatusRecord
                                                                        .friendLastAlcohol
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme
                                                                          .secondaryColor,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Food: ',
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        10,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          8,
                                                                          0),
                                                                  child: Text(
                                                                    listViewStatusRecord
                                                                        .friendLastFood
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1
                                                                        .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme
                                                                          .secondaryColor,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      final receiver =
                                                          listViewStatusRecord
                                                              .friend;
                                                      final sender =
                                                          currentUserReference;
                                                      final updateTimestamp =
                                                          getCurrentTimestamp;
                                                      final friendName =
                                                          currentUserDisplayName;
                                                      final friendPhotoUrl =
                                                          currentUserPhoto;

                                                      final pingsRecordData =
                                                          createPingsRecordData(
                                                        receiver: receiver,
                                                        sender: sender,
                                                        updateTimestamp:
                                                            updateTimestamp,
                                                        friendName: friendName,
                                                        friendPhotoUrl:
                                                            friendPhotoUrl,
                                                      );

                                                      await PingsRecord
                                                          .collection
                                                          .doc()
                                                          .set(pingsRecordData);
                                                    },
                                                    child: Icon(
                                                      Icons.soap_rounded,
                                                      color: FlutterFlowTheme
                                                          .primaryColor,
                                                      size: 24,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
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
      },
    );
  }
}
