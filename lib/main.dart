import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color drawerButtonHoverColor = const Color.fromRGBO(43, 44, 47, 1);
Color hoverButtonColor = const Color.fromRGBO(52, 53, 65, 1);
Color sideBarColor = const Color(0xff202123);
Color borderColor = const Color(0xffC8C8C9);
Color bgHighlightColor = const Color.fromRGBO(64, 65, 79, 1);
Color bgHoverColor = const Color.fromRGBO(32, 33, 35, 1);

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
  String msg = "";
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
              child: Column(
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 260),
                    width: 252,
                    height: 44,
                    color: sideBarColor,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 192,
                          height: 44,
                          child: HoverButton(
                            onPressed: (){},
                            hoverColor: hoverButtonColor,
                            borderColor: borderColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Icon(Icons.add,color: Colors.white.withOpacity(0.8),size: 18,),
                                  const SizedBox(width: 12),
                                  const Text("New chat",style: TextStyle(color: Colors.white))
                                ],
                              ),
                            )
                          ),
                        ),

                        const SizedBox(width: 8),

                        SizedBox(
                          width: 44,
                          height: 44,
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
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
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
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person_outline,color: Colors.white.withOpacity(0.8),size: 18,),
                                        const SizedBox(width: 12),
                                        const Text("Upgrade to Plus",style: TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(250, 230, 158, 1),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Center(
                                        child: Text("NEW",style: TextStyle(fontSize: 12),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: HoverButton(
                              onPressed: (){},
                              borderColor: Colors.transparent,
                              hoverColor: hoverButtonColor,
                              borderRadius: 6,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person_pin_rounded,color: Colors.white.withOpacity(0.8),size: 18,),
                                        const SizedBox(width: 12),
                                        const Text("Username",style: TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    Icon(Icons.more_horiz,color: Colors.white.withOpacity(0.5),size: 14)
                                  ],
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
            ),
          ),
          Expanded(
            child: Container(
              color: hoverButtonColor,
              child: Stack(
                children: [
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
                                    const Expanded(
                                      child: Text(
                                        "ChatGPT",
                                        style: TextStyle(
                                          color: Colors.white,
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
                                      hints: const [
                                        "Explain quantum computing in simple terms",
                                        "Got any creative ideas for a 10 year old’s birthday?",
                                        "How do I make an HTTP request in Javascript?",
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: ColumnExamples(
                                        icon: MdiIcons.flashOutline,
                                        title: "Capabilities",
                                        hints: const [
                                          "Remembers what user said earlier in the conversation",
                                          "Allows user to provide follow-up corrections",
                                          "Trained to decline inappropriate requests",
                                        ],
                                      ),
                                    ),
                                    ColumnExamples(
                                      icon: Icons.warning_amber_rounded,
                                      title: "Limitations",
                                      hints: const [
                                        "May occasionally generate incorrect information",
                                        "May occasionally produce harmful instructions or biased content",
                                        "Limited knowledge of world and events after 2021",
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
                                  color: const Color.fromRGBO(64, 65, 79, 1),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5
                                    )
                                  ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16,right: 8),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 2),
                                          child: TextField(
                                            maxLines: null,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Send a message",
                                                hintStyle: TextStyle(color: Colors.white38,fontSize: 15)
                                            ),
                                            onChanged: (e){
                                              setState(() {
                                                msg = textEditingController.text;
                                              });
                                            },
                                            controller: textEditingController,
                                            cursorColor: Colors.white,
                                            cursorWidth: 2,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
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

                              const SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 12,bottom: 24,right: 16,left: 16),
                                  child: Center(
                                    child: Text(
                                      "Free Research Preview. ChatGPT may produce inaccurate information about people, places, or facts. ChatGPT May 24 Version",
                                      style: TextStyle(color: Colors.white60,fontSize: 12),
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
  ColumnExamples({Key? key, this.icon = Icons.wb_sunny_outlined, this.title = "Examples",this.hints = const []}) : super(key: key);
  IconData icon;
  String title;
  List<String> hints;
  @override
  State<ColumnExamples> createState() => _ColumnExamplesState();
}

class _ColumnExamplesState extends State<ColumnExamples> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(widget.icon,color: Colors.white.withOpacity(0.8),size: 32),
                Text(widget.title,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
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
                    color: bgHighlightColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  width: double.infinity,
                  height: 64,
                  child: HoverButton(
                    onPressed: (){},
                    hoverColor: bgHoverColor,
                    borderColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: Text(
                          widget.hints[0],
                          style: const TextStyle(color: Colors.white),
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
                      color: bgHighlightColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    width: double.infinity,
                    height: 64,
                    child: HoverButton(
                      onPressed: (){},
                      hoverColor: bgHoverColor,
                      borderColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Center(
                          child: Text(
                            widget.hints[1],
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: bgHighlightColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  width: double.infinity,
                  height: 64,
                  child: HoverButton(
                    onPressed: (){},
                    hoverColor: bgHoverColor,
                    borderColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: Text(
                          widget.hints[2],
                          style: const TextStyle(color: Colors.white),
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
