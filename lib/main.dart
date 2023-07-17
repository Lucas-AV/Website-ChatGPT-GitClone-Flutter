import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

Color drawerButtonHoverColor = const Color.fromRGBO(43, 44, 47, 1);
Color hoverButtonColor = const Color.fromRGBO(52, 53, 65, 1);
Color sideBarColor = const Color(0xff202123);
Color borderColor = const Color(0xffC8C8C9);
Color bgHighlightColor = const Color.fromRGBO(64, 65, 79, 1);
Color bgHoverColor = const Color.fromRGBO(32, 33, 35, 1);

void _selectAndUploadFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    // Get the file path
    String filePath = result.files.single.path!;

    // Perform the file upload operation using the file path
    // Implement your file upload logic here
  } else {
    // User canceled the file selection
  }
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeChatGPT(),
    );
  }
}

class HomeChatGPT extends StatefulWidget {
  const HomeChatGPT({Key? key}) : super(key: key);

  @override
  State<HomeChatGPT> createState() => _HomeChatGPTState();
}

class _HomeChatGPTState extends State<HomeChatGPT> {
  TextEditingController textEditingController = TextEditingController();
  bool drawerOpen = true;
  double drawerWidth = 260;
  List<String> history = [];
  bool profileSelected = false;
  bool fileClick = false;
  bool micF = false;
  String msg = "";
  int index = 0;
  bool doubleMode = false;
  bool isDark = true;
  Color lightColor = Colors.white;
  Color darkColor = hoverButtonColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            color: sideBarColor,
            constraints: const BoxConstraints(maxWidth: 260),
            width: drawerWidth,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  Column(
                    children: [
                      LayoutBuilder(
                        builder: (context,constraints){
                          return Container(
                            constraints: const BoxConstraints(maxWidth: 260),
                            width: constraints.maxWidth,
                            height: 44,
                            color: sideBarColor,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: constraints.maxWidth*0.785,
                                  height: 44,
                                  child: HoverButton(
                                      onPressed: (){},
                                      hoverColor: hoverButtonColor,
                                      borderColor: borderColor,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*0.042),
                                        child: Row(
                                          children: [
                                            Icon(Icons.add,color: Colors.white.withOpacity(0.8),size: constraints.maxWidth*0.08,),
                                            SizedBox(width: constraints.maxWidth*0.044),
                                            Text("New chat",style: TextStyle(color: Colors.white,fontSize: constraints.maxWidth*0.055))
                                          ],
                                        ),
                                      )
                                  ),
                                ),

                                SizedBox(width: constraints.maxWidth*0.032),

                                SizedBox(
                                  width: constraints.maxWidth*0.036*5,
                                  height: constraints.maxWidth*0.036*5,
                                  child: HoverButton(
                                    onPressed: (){
                                      setState(() {
                                        drawerWidth = 0;
                                      });
                                      Future.delayed(
                                          const Duration(milliseconds: 200),(){
                                        setState(() {
                                          drawerOpen = false;
                                        });
                                      });
                                    },
                                    hoverColor: hoverButtonColor,
                                    borderColor: borderColor,
                                    child: Center(
                                        child: Container(
                                          height: constraints.maxWidth*0.035*2,
                                          width: constraints.maxWidth*0.035*2,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white.withOpacity(0.75),width: constraints.maxWidth*0.008,),
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(width: constraints.maxWidth*0.008),
                                              Container(
                                                color: Colors.white.withOpacity(0.75),
                                                width: constraints.maxWidth*0.008,
                                                height: constraints.maxWidth*0.008*7,
                                              )
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          );
                        }
                      ),
                      LayoutBuilder(
                        builder: (context,constraints){
                          return Container(
                            width: constraints.maxWidth,
                            height: 62,
                            decoration: BoxDecoration(
                                color: sideBarColor,
                                border: Border(
                                  bottom: BorderSide(width: 0.5,color: borderColor),
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8,bottom: 8),
                              child: HoverButton(

                                onPressed: (){
                                  setState(() {});
                                },
                                hoverColor: hoverButtonColor,
                                borderColor: borderColor,
                                borderRadius: 6,
                                child: Padding(
                                  padding: EdgeInsets.all(constraints.maxWidth*0.042),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.folder_copy_outlined,color: Colors.white.withOpacity(0.8),size: constraints.maxWidth*0.08,),
                                          SizedBox(width: constraints.maxWidth*0.044),
                                          Text("View folders",style: TextStyle(color: Colors.white,fontSize: constraints.maxWidth*0.055))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      ),

                      const SizedBox(height: 4),
                      Expanded(
                        child: SingleChildScrollView(
                          child: LayoutBuilder(
                            builder: (context,constraints){
                              return Column(
                                children: [
                                  for(int id = 0; id < 100; id++)
                                    AnimatedContainer(
                                        duration: const Duration(milliseconds: 200),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: index == id? hoverButtonColor : Colors.transparent,
                                        ),
                                        height: 40,
                                        child: HoverButton(
                                            onPressed: (){
                                              setState(() {
                                                doubleMode = doubleMode? false:true;
                                                index = id;
                                              });
                                            },
                                            hoverColor: hoverButtonColor,
                                            borderColor: Colors.transparent,
                                            child: Padding(
                                                padding: EdgeInsets.only(left: constraints.maxWidth*.063,right: constraints.maxWidth*.063),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons.chat_bubble_outline,color: Colors.white.withOpacity(0.8),size: constraints.maxWidth*.065,),
                                                        SizedBox(width: constraints.maxWidth*.065,),
                                                        Text(
                                                            "Template #${id+1}",
                                                            style: TextStyle(color: Colors.white,fontSize: constraints.maxWidth*0.055),maxLines: 1,overflow: TextOverflow.ellipsis,
                                                        )
                                                      ],
                                                    ),
                                                    if(index == id)
                                                      Row(
                                                        children: [
                                                          Icon(
                                                              Icons.edit_outlined,size: constraints.maxWidth*.065,
                                                              color: Colors.white.withOpacity(0.9)
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*.065/2),
                                                            child: Icon(
                                                                Icons.ios_share_outlined,size: constraints.maxWidth*.065,
                                                                color: Colors.white.withOpacity(0.9)
                                                            ),
                                                          ),
                                                          Icon(
                                                              Icons.delete_outline,size: constraints.maxWidth*.065,
                                                              color: Colors.white.withOpacity(0.9)
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                )
                                            )
                                        )
                                    ),
                                ],
                              );
                            }
                          ),
                        ),
                      ),
                      LayoutBuilder(
                        builder: (context,constraints){
                          return Container(
                            decoration: BoxDecoration(
                                color: sideBarColor,
                                border: Border(
                                  top: BorderSide(width: 0.5,color: borderColor),
                                )
                            ),
                            constraints: const BoxConstraints(maxWidth: 252),
                            width: double.infinity,
                            height: 97,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: HoverButton(
                                      onPressed: (){},
                                      borderColor: Colors.transparent,
                                      hoverColor: hoverButtonColor,
                                      borderRadius: 6,
                                      child: Padding(
                                        padding: EdgeInsets.all(constraints.maxWidth*0.042),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.person_outline,color: Colors.white.withOpacity(0.8),size: constraints.maxWidth*0.08,),
                                                SizedBox(width: constraints.maxWidth*0.044),
                                                Text("Upgrade to Plus",style: TextStyle(color: Colors.white,fontSize: constraints.maxWidth*0.055))
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*0.03,vertical: 2),
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(250, 230, 158, 1),
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Center(
                                                child: Text("NEW",style: TextStyle(fontSize: constraints.maxWidth*0.045),),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: HoverButton(
                                      onPressed: (){
                                        setState(() {
                                          profileSelected = profileSelected? false:true;
                                        });
                                      },
                                      borderColor: Colors.transparent,
                                      hoverColor: hoverButtonColor,
                                      borderRadius: 6,
                                      child: Padding(
                                        padding: EdgeInsets.all(constraints.maxWidth*0.044),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.person_pin_rounded,color: Colors.white.withOpacity(0.8),size: constraints.maxWidth*0.08,),
                                                SizedBox(width: constraints.maxWidth*0.044),
                                                Text("Username",style: TextStyle(color: Colors.white,fontSize: constraints.maxWidth*0.055))
                                              ],
                                            ),
                                            Icon(Icons.more_horiz,color: Colors.white.withOpacity(0.5),size: constraints.maxWidth*0.05)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      )
                    ],
                  ),
                  if(profileSelected)
                    Positioned(
                      bottom: 97/2+4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromRGBO(5, 5, 9, 1),
                        ),
                        width: 244,
                        height: 199,
                        child: Padding(
                          padding: const EdgeInsets.only(top:4),
                          child: Column(
                            children: [
                              HoverButton(
                                onPressed: (){},
                                hoverColor: hoverButtonColor,
                                borderColor: Colors.transparent,
                                borderRadius: 0,
                                child: SizedBox(
                                  width: 244,
                                  height: 44,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Icon(MdiIcons.deleteOutline,color: Colors.white.withOpacity(0.8),size: 18,),
                                        const SizedBox(width: 12),
                                        const Text("Clear conversations",style: TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              HoverButton(
                                onPressed: (){},
                                hoverColor: hoverButtonColor,
                                borderColor: Colors.transparent,
                                borderRadius: 0,
                                child: SizedBox(
                                  width: 244,
                                  height: 44,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Icon(MdiIcons.exportVariant,color: Colors.white.withOpacity(0.8),size: 18,),
                                        const SizedBox(width: 12),
                                        const Text("Help & FAQ",style: TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              HoverButton(
                                onPressed: (){},
                                hoverColor: hoverButtonColor,
                                borderColor: Colors.transparent,
                                borderRadius: 0,
                                child: SizedBox(
                                  width: 244,
                                  height: 44,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Icon(Icons.settings_outlined,color: Colors.white.withOpacity(0.8),size: 18,),
                                        const SizedBox(width: 12),
                                        const Text("Settings",style: TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: double.infinity,
                                height: 0.5,
                                color: borderColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: HoverButton(
                                  onPressed: (){},
                                  hoverColor: hoverButtonColor,
                                  borderColor: Colors.transparent,
                                  borderRadius: 0,
                                  child: SizedBox(
                                    width: 244,
                                    height: 44,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Row(
                                        children: [
                                          Icon(Icons.exit_to_app_rounded,color: Colors.white.withOpacity(0.8),size: 18,),
                                          const SizedBox(width: 12),
                                          const Text("Log out",style: TextStyle(color: Colors.white))
                                        ],
                                      ),
                                    ),
                                  ),
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
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              color: isDark? darkColor:lightColor,
              child: doubleMode? Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12,top: 64),
                      child: Container(
                        height: double.infinity,
                        width: 0.5,
                        color: borderColor,
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Container(width: 8,color: sideBarColor,),
                      Expanded(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Container(
                                color: sideBarColor,
                                height: 48,
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: drawerOpen? 0:0),
                                      child: Container(
                                        width: 155,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: isDark?hoverButtonColor:Colors.white,
                                          borderRadius: const BorderRadius.vertical(top: Radius.circular(7))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Template #1",style: TextStyle(color: isDark?Colors.white:Colors.black.withOpacity(0.8))),
                                              Icon(Icons.close_rounded,color: isDark?Colors.white:Colors.black.withOpacity(0.8),size: 14,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: !drawerOpen,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8,top: 8+48),
                                child: SizedBox(
                                  width: 44,
                                  height: 44,
                                  child: HoverButton(
                                    onPressed: (){
                                      setState(() {
                                        drawerOpen = true;
                                        drawerWidth = 260;
                                      });
                                    },
                                    hoverColor: hoverButtonColor,
                                    borderColor: borderColor,
                                    child: Center(
                                        child: Container(
                                          height: 16,
                                          width: 16,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white.withOpacity(0.75),width: 2),
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 2),
                                              Container(
                                                color: Colors.white.withOpacity(0.75),
                                                width: 2,
                                                height: 14,
                                              )
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 634,
                                  width: 720,
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8,top: 8,right: 8),
                                  child: SizedBox(
                                    child: Column(
                                      children: [
                                        Container(
                                          constraints: const BoxConstraints(maxHeight: 286),
                                          width: 768,
                                          decoration: BoxDecoration(
                                            color: !isDark? Colors.white:const Color.fromRGBO(64, 65, 79, 1),
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 5
                                              )
                                            ]
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8,right: 8),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8,right: 8),
                                                  child: Tooltip(
                                                    verticalOffset: -45,
                                                    message: "Send file",
                                                    child: AnimatedContainer(
                                                      duration: const Duration(milliseconds: 200),
                                                      height: 32,
                                                      width: 32,
                                                      decoration: BoxDecoration(
                                                        color: !fileClick? Colors.transparent : Colors.deepOrangeAccent,
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: HoverButton(
                                                        onPressed: () async {

                                                          setState(() {
                                                            fileClick = fileClick? false:true;
                                                          });
                                                          var result;
                                                          if(fileClick){
                                                            FilePickerResult? result = await FilePicker.platform.pickFiles();
                                                          }
                                                          if(result == null){
                                                            setState(() {
                                                              fileClick = false;
                                                            });
                                                          }
                                                        },
                                                        hoverColor: Colors.transparent, borderColor: Colors.transparent,
                                                        mode: "chat",
                                                        child: Icon(fileClick? Icons.file_copy:Icons.file_copy_outlined,color: !isDark && !fileClick? Colors.black.withOpacity(0.75):Colors.white.withOpacity(isDark?0.9:1),size: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(bottom: 2),
                                                    child: TextField(
                                                      maxLines: null,
                                                      decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: !micF? "Send a message":"...",
                                                          hintStyle: TextStyle(color: isDark? Colors.white38:Colors.black45,fontSize: 15)
                                                      ),
                                                      onChanged: (e){
                                                        setState(() {
                                                          msg = textEditingController.text;
                                                        });
                                                      },
                                                      controller: textEditingController,
                                                      cursorColor: isDark? Colors.white:Colors.black.withOpacity(0.2),
                                                      cursorWidth: 2,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: isDark? Colors.white:Colors.black.withOpacity(0.6),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                msg.isEmpty? Padding(
                                                  padding: const EdgeInsets.only(bottom: 8),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(milliseconds: 200),
                                                    height: 32,
                                                    width: 32,
                                                    decoration: BoxDecoration(
                                                      color: !micF? Colors.transparent : Colors.deepPurpleAccent,
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    child: HoverButton(
                                                      onPressed: (){
                                                        setState(() {
                                                          micF = micF? false:true;
                                                        });
                                                      },
                                                      hoverColor: Colors.transparent, borderColor: Colors.transparent,
                                                      secondCondition: msg.isEmpty,
                                                      mode: "chat",
                                                      child: Icon(Icons.mic,color: !isDark && !micF? Colors.black.withOpacity(0.75):Colors.white.withOpacity(isDark?0.9:1),size: 20),
                                                    ),
                                                  ),
                                                ):Padding(
                                                  padding: const EdgeInsets.only(bottom: 8),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(milliseconds: 200),
                                                    height: 32,
                                                    width: 32,
                                                    decoration: BoxDecoration(
                                                      color: msg.isEmpty? Colors.transparent : const Color.fromRGBO(25, 195, 125, 1),
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    child: HoverButton(
                                                      onPressed: (){},
                                                      hoverColor: Colors.transparent, borderColor: Colors.transparent,
                                                      secondCondition: msg.isEmpty,
                                                      mode: "chat",
                                                      child: Icon(Icons.send_rounded,color: Colors.white.withOpacity(msg.isEmpty?0.6:1),size: 16),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: double.infinity,
                                          height: 52,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 12,bottom: 24,right: 16,left: 16),
                                            child: Center(
                                              child: Text(
                                                "Free Research Preview. ChatGPT may produce inaccurate information about people, places, or facts. ChatGPT May 24 Version",
                                                style: TextStyle(color: isDark?Colors.white60:Colors.black45,fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Container(
                                color: sideBarColor,
                                height: 48,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1),
                                      child: Container(
                                        width: 155,
                                        height: 36,
                                        decoration: BoxDecoration(
                                            color: isDark?hoverButtonColor:Colors.white,
                                            borderRadius: const BorderRadius.vertical(top: Radius.circular(7))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:  [
                                              Text("Template #2",style: TextStyle(color: isDark?Colors.white:Colors.black.withOpacity(0.8))),
                                              Icon(Icons.close_rounded,color: isDark?Colors.white:Colors.black.withOpacity(0.8),size: 14,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10+48,
                              right: 10,
                              child: Tooltip(
                                message: "Shift + T",
                                textStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isDark = isDark? false:true;
                                      });
                                    },
                                    child: Icon(isDark?MdiIcons.weatherSunny:Icons.dark_mode_outlined,color: !isDark? darkColor:lightColor,size: 36))
                              )
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Tooltip(
                                message: "Tutorial",
                                textStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                child: Icon(Icons.question_mark,color: !isDark? darkColor:lightColor,size: drawerOpen? 0:36)
                              )
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 634,
                                  width: 720,
                                  // child: Center(
                                  //   child: Column(
                                  //     children: [
                                  //       Expanded(
                                  //         child: Column(
                                  //           children: [
                                  //             Expanded(
                                  //               flex: 2,
                                  //               child: Container(),
                                  //             ),
                                  //             const Expanded(
                                  //               child: Text(
                                  //                   "ChatGPT",
                                  //                   style: TextStyle(
                                  //                       color: Colors.white,
                                  //                       fontSize: 40,
                                  //                       fontWeight: FontWeight.bold
                                  //                   )
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       SizedBox(
                                  //         width: double.infinity,
                                  //         height: 314,
                                  //         child: Row(
                                  //           children: [
                                  //             ColumnExamples(
                                  //               icon: MdiIcons.clouds,
                                  //               title: "Useful requests",
                                  //               hints: const [
                                  //                 'Give me examples of questions to ask for an artificial intelligence',
                                  //                 "Generate a template for ask better questions to you",
                                  //                 "How can I center a div?",
                                  //               ],
                                  //             ),
                                  //             Padding(
                                  //               padding: const EdgeInsets.symmetric(horizontal: 15),
                                  //               child: ColumnExamples(
                                  //                 icon: Icons.menu_book_rounded,
                                  //                 title: "Curiosity",
                                  //                 hints: const [
                                  //                   "Recommend me a random book",
                                  //                   "Create a table using markdown",
                                  //                   "Draw a duck using ASCII ART",
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //             ColumnExamples(
                                  //               icon: Icons.warning_amber_rounded,
                                  //               title: "Important",
                                  //               hints: const [
                                  //                 "What is your database based on?",
                                  //                 "What is your limitations?",
                                  //                 "What can you do for me?",
                                  //               ],
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8,top: 8,right: 8),
                                  child: SizedBox(
                                    child: Column(
                                      children: [
                                        Container(
                                          constraints: const BoxConstraints(maxHeight: 286),
                                          width: 768,
                                          decoration: BoxDecoration(
                                              color: !isDark? Colors.white:const Color.fromRGBO(64, 65, 79, 1),
                                              borderRadius: BorderRadius.circular(8),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5
                                                )
                                              ]
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8,right: 8),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8,right: 8),
                                                  child: Tooltip(
                                                    verticalOffset: -45,
                                                    message: "Send file",
                                                    child: AnimatedContainer(
                                                      duration: const Duration(milliseconds: 200),
                                                      height: 32,
                                                      width: 32,
                                                      decoration: BoxDecoration(
                                                        color: !fileClick? Colors.transparent : Colors.deepOrangeAccent,
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                      child: HoverButton(
                                                        onPressed: () async {
                                                          setState(() {
                                                            fileClick = fileClick? false:true;
                                                          });
                                                          var result;
                                                          if(fileClick){
                                                            FilePickerResult? result = await FilePicker.platform.pickFiles();
                                                          }
                                                          if(result == null){
                                                            setState(() {
                                                              fileClick = false;
                                                            });
                                                          }

                                                        },
                                                        hoverColor: Colors.transparent, borderColor: Colors.transparent,
                                                        mode: "chat",
                                                        child: Icon(fileClick? Icons.file_copy:Icons.file_copy_outlined,color: !isDark && !fileClick? Colors.black.withOpacity(0.75):Colors.white.withOpacity(isDark?0.9:1),size: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(bottom: 2),
                                                    child: TextField(
                                                      maxLines: null,
                                                      decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: !micF? "Send a message":"...",
                                                          hintStyle: TextStyle(color: isDark? Colors.white38:Colors.black45,fontSize: 15)
                                                      ),
                                                      onChanged: (e){
                                                        setState(() {
                                                          msg = textEditingController.text;
                                                        });
                                                      },
                                                      controller: textEditingController,
                                                      cursorColor: isDark? Colors.white:Colors.black.withOpacity(0.2),
                                                      cursorWidth: 2,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: isDark? Colors.white:Colors.black.withOpacity(0.6),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                msg.isEmpty? Padding(
                                                  padding: const EdgeInsets.only(bottom: 8),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(milliseconds: 200),
                                                    height: 32,
                                                    width: 32,
                                                    decoration: BoxDecoration(
                                                      color: !micF? Colors.transparent : Colors.deepPurpleAccent,
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    child: HoverButton(
                                                      onPressed: (){
                                                        setState(() {
                                                          micF = micF? false:true;
                                                        });
                                                      },
                                                      hoverColor: Colors.transparent, borderColor: Colors.transparent,
                                                      secondCondition: msg.isEmpty,
                                                      mode: "chat",
                                                      child: Icon(Icons.mic,color: !isDark && !micF? Colors.black.withOpacity(0.75):Colors.white.withOpacity(isDark?0.9:1),size: 20),
                                                    ),
                                                  ),
                                                ):Padding(
                                                  padding: const EdgeInsets.only(bottom: 8),
                                                  child: AnimatedContainer(
                                                    duration: const Duration(milliseconds: 200),
                                                    height: 32,
                                                    width: 32,
                                                    decoration: BoxDecoration(
                                                      color: msg.isEmpty? Colors.transparent : const Color.fromRGBO(25, 195, 125, 1),
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    child: HoverButton(
                                                      onPressed: (){},
                                                      hoverColor: Colors.transparent, borderColor: Colors.transparent,
                                                      secondCondition: msg.isEmpty,
                                                      mode: "chat",
                                                      child: Icon(Icons.send_rounded,color: Colors.white.withOpacity(msg.isEmpty?0.6:1),size: 16),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: double.infinity,
                                          height: 52,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 12,bottom: 24,right: 16,left: 16),
                                            child: Center(
                                              child: Text(
                                                "Free Research Preview. ChatGPT may produce inaccurate information about people, places, or facts. ChatGPT May 24 Version",
                                                style: TextStyle(color: isDark?Colors.white60:Colors.black45,fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ): Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Tooltip(
                      message: "Shift + T",
                      textStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isDark = isDark? false:true;
                          });
                        },
                        child: Icon(!isDark?Icons.dark_mode_outlined:MdiIcons.weatherSunny,color: !isDark? darkColor:lightColor,size: 36)))
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: Tooltip(
                        message: "Tutorial",
                        textStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        child: Icon(Icons.question_mark,color: !isDark? darkColor:lightColor,size: 36))
                  ),
                  Visibility(
                    visible: !drawerOpen,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8,top: 8),
                      child: SizedBox(
                        width: 44,
                        height: 44,
                        child: HoverButton(
                          onPressed: (){
                            setState(() {
                              drawerOpen = true;
                              drawerWidth = 260;
                            });
                          },
                          hoverColor: hoverButtonColor,
                          borderColor: borderColor,
                          child: Center(
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white.withOpacity(0.75),width: 2),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 2),
                                    Container(
                                      color: Colors.white.withOpacity(0.75),
                                      width: 2,
                                      height: 14,
                                    )
                                  ],
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 634,
                        width: 720,
                        child: Center(
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "ChatGPT",
                                        style: TextStyle(
                                          color: !isDark? Colors.black:Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 314,
                                child: Row(
                                  children: [
                                    ColumnExamples(
                                      isDark: isDark,
                                      icon: MdiIcons.clouds,
                                      title: "Useful requests",
                                      hints: const [
                                        'Give me examples of questions to ask for an artificial intelligence',
                                        "Generate a template for ask better questions to you",
                                        "How can I center a div?",
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: ColumnExamples(
                                        isDark: isDark,
                                        icon: Icons.menu_book_rounded,
                                        title: "Curiosity",
                                        hints: const [
                                          "Recommend me a random book",
                                          "Create a table using markdown",
                                          "Draw a duck using ASCII ART",
                                        ],
                                      ),
                                    ),
                                    ColumnExamples(
                                      isDark: isDark,
                                      icon: Icons.warning_amber_rounded,
                                      title: "Important",
                                      hints: const [
                                        "What is your database based on?",
                                        "What is your limitations?",
                                        "What can you do for me?",
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,top: 8,right: 8),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Container(
                                constraints: const BoxConstraints(maxHeight: 286),
                                width: 768,
                                decoration: BoxDecoration(
                                  color: !isDark? Colors.white:const Color.fromRGBO(64, 65, 79, 1),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5
                                    )
                                  ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8,right: 8),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8,right: 8),
                                        child: Tooltip(
                                          verticalOffset: -45,
                                          message: "Send file",
                                          child: AnimatedContainer(
                                            duration: const Duration(milliseconds: 200),
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                              color: !fileClick? Colors.transparent : Colors.deepOrangeAccent,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: HoverButton(
                                              onPressed: () async {
                                                setState(() {
                                                  fileClick = fileClick? false:true;
                                                });
                                                var result;
                                                if(fileClick){
                                                  FilePickerResult? result = await FilePicker.platform.pickFiles();
                                                }
                                                if(result == null){
                                                  setState(() {
                                                    fileClick = false;
                                                  });
                                                }
                                              },
                                              hoverColor: Colors.transparent, borderColor: Colors.transparent,
                                              mode: "chat",
                                              child: Icon(fileClick? Icons.file_copy:Icons.file_copy_outlined,color: !isDark && !fileClick? Colors.black.withOpacity(0.75):Colors.white.withOpacity(isDark?0.9:1),size: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 2),
                                          child: TextField(
                                            maxLines: null,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: !micF? "Send a message":"...",
                                                hintStyle: TextStyle(color: isDark? Colors.white38:Colors.black45,fontSize: 15)
                                            ),
                                            onChanged: (e){
                                              setState(() {
                                                msg = textEditingController.text;
                                              });
                                            },
                                            controller: textEditingController,
                                            cursorColor: isDark? Colors.white:Colors.black.withOpacity(0.2),
                                            cursorWidth: 2,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: isDark? Colors.white:Colors.black.withOpacity(0.6),
                                            ),
                                          ),
                                        ),
                                      ),
                                      msg.isEmpty? Padding(
                                        padding: const EdgeInsets.only(bottom: 8),
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 200),
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: !micF? Colors.transparent : Colors.deepPurpleAccent,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: HoverButton(
                                            onPressed: (){
                                              setState(() {
                                                micF = micF? false:true;
                                              });
                                            },
                                            hoverColor: Colors.transparent, borderColor: Colors.transparent,
                                            secondCondition: msg.isEmpty,
                                            mode: "chat",
                                            child: Icon(Icons.mic,color: !isDark && !micF? Colors.black.withOpacity(0.75):Colors.white.withOpacity(isDark?0.9:1),size: 20),
                                          ),
                                        ),
                                      ):Padding(
                                        padding: const EdgeInsets.only(bottom: 8),
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 200),
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: msg.isEmpty? Colors.transparent : const Color.fromRGBO(25, 195, 125, 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: HoverButton(
                                            onPressed: (){},
                                            hoverColor: Colors.transparent, borderColor: Colors.transparent,
                                            secondCondition: msg.isEmpty,
                                            mode: "chat",
                                            child: Icon(Icons.send_rounded,color: Colors.white.withOpacity(msg.isEmpty?0.6:1),size: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12,bottom: 24,right: 16,left: 16),
                                  child: Center(
                                    child: Text(
                                      "Free Research Preview. ChatGPT may produce inaccurate information about people, places, or facts. ChatGPT May 24 Version",
                                      style: TextStyle(color: isDark?Colors.white60:Colors.black45,fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  HoverButton({Key? key, required this.onPressed, this.secondCondition = false, this.mode = "", required this.child, required this.hoverColor, required this.borderColor, this.borderRadius = 8.0});
  final Function onPressed;
  final Widget child;
  final Color hoverColor;
  final Color borderColor;
  Icon ico = const Icon(Icons.mic,color: Colors.white);
  bool secondCondition;
  String mode;
  double borderRadius;
  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed(),
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        cursor: _isHovered? (widget.mode == "chat" && widget.secondCondition? SystemMouseCursors.basic : SystemMouseCursors.click) : SystemMouseCursors.basic,
        child: Container(
          decoration: BoxDecoration(
            color: _isHovered? widget.hoverColor:Colors.transparent,
            border: Border.all(
              color: widget.borderColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class ColumnExamples extends StatefulWidget {
  ColumnExamples({Key? key, this.icon = Icons.wb_sunny_outlined, this.title = "Examples",this.hints = const [], required this.isDark}) : super(key: key);
  IconData icon;
  final bool isDark;
  String title;
  List<String> hints;
  @override
  State<ColumnExamples> createState() => _ColumnExamplesState();
}

class _ColumnExamplesState extends State<ColumnExamples> {
  @override
  Widget build(BuildContext context) {
    Color fontColor = Colors.black.withOpacity(0.75);
    return SizedBox(
      width: 230,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(widget.icon,color: widget.isDark? Colors.white.withOpacity(0.8):fontColor,size: 32),
                Text(widget.title,style: TextStyle(color: widget.isDark?Colors.white:fontColor,fontSize: 18,fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          SizedBox(
            height: 240,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.isDark? bgHighlightColor:const Color(0xfff7f7f8),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  width: double.infinity,
                  height: 64,
                  child: HoverButton(
                    onPressed: (){},
                    hoverColor: widget.isDark? bgHoverColor:const Color(0xffd9d9e3),
                    borderColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: Text(
                          widget.hints[0],
                          style: TextStyle(color: widget.isDark?Colors.white:Colors.black),
                          textAlign: TextAlign.center,
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.isDark? bgHighlightColor:const Color(0xfff7f7f8),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    width: double.infinity,
                    height: 64,
                    child: HoverButton(
                      onPressed: (){},
                      hoverColor: widget.isDark? bgHoverColor:const Color(0xffd9d9e3),
                      borderColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Center(
                          child: Text(
                            widget.hints[1],
                            style: TextStyle(color: widget.isDark?Colors.white:Colors.black),
                            textAlign: TextAlign.center,
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: widget.isDark? bgHighlightColor:const Color(0xfff7f7f8),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  width: double.infinity,
                  height: 64,
                  child: HoverButton(
                    onPressed: (){},
                    hoverColor: widget.isDark? bgHoverColor:const Color(0xffd9d9e3),
                    borderColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: Text(
                          widget.hints[2],
                          style: TextStyle(color: widget.isDark?Colors.white:Colors.black),
                          textAlign: TextAlign.center,
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SideBarTile extends StatefulWidget {
  SideBarTile({Key? key, required this.index, required this.id}) : super(key: key);
  final int id;
  int index;
  @override
  State<SideBarTile> createState() => _SideBarTileState();
}

class _SideBarTileState extends State<SideBarTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.index == widget.id? hoverButtonColor : Colors.transparent,
      ),
          height: 40,
          width: double.infinity,
          child: HoverButton(
              onPressed: (){
                setState(() {
                  widget.index = widget.id;
                });
              },
              hoverColor: hoverButtonColor,
              borderColor: Colors.transparent,
              child: Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.chat_bubble_outline,color: Colors.white.withOpacity(0.8),size: 18,),
                          const SizedBox(width: 12),
                          const Text(
                              "Template",
                              style: TextStyle(color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                              Icons.edit_outlined,
                              size: 16,
                              color: Colors.white.withOpacity(0.9)
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                                Icons.folder_copy_outlined,
                                size: 16,
                                color: Colors.white.withOpacity(0.9)
                            ),
                          ),
                          Icon(
                              Icons.delete_outline,
                              size: 16,
                              color: Colors.white.withOpacity(0.9)
                          ),
                        ],
                      ),
                    ],
                  )
              )
          )
      );
  }
}
