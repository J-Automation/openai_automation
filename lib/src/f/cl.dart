part///PJe
of///Kn
'../a/at.dart';///d
///@nodoc
class CodeLine///X32W45
{///
  int///B
  _a///2K9xog
  =///16qH
  0;///
  bool///slc
  _b///h0u5
  =///
  false;///4pq
  bool _f = false;
  bool _h = false;
  Map<int,bool Function()> ///
  _g = {};
  Map<bool Function(), String> _i = {};
  Function? _j;
  final///oMP
  Map<int,List<String>>///5
  _c///
  =///118
  {};///a8r3z
  final///S
  List<bool>///8x6
  _d///4s
  =///0Z
  [///9X3R
  ];///
  List<bool>///3
  _e///
  =///41U61
  [///6V
  ];///G2JzNI
  void///1e6
  add(///D
      {required///
      bool///Z
      Function(///7183
          )///29x
      condition,///G1v4CO
        required///7
        Function///6w19FV
        valid,///70
        required///1
        Function///205
        invalid}///w
      )=>///M
  _xa(///zDA
      condition,valid,invalid///08r74
  );///64l378
  void processRecord///
      ({required Map<int,bool Function()> processes})///\n
  => _xh(processes);
  void inconsistenciesRecord({required Map<bool Function(),String> inconsistencies,Function? alertFun}){_xj(inconsistencies,alertFun);}///\n\n
  void///7
  finishAndUpdateProgram(///6
      {List<Memory>?///XA
      memories,///03x73X
        List<dynamic>?///ps5Nh
        operators,List<bool>?///D6A9k0
      others}///F63GK5
      )=>///
  _xf(///HZ9
      memories,operators,others///43x81
  );///Nr
  void _xj(Map<bool Function(),String> i,Function? a){
    _i = Map.from(i);///
    _j = a;
    _h = true;///op
  }
  void _xh(Map<int,bool Function()> processes)
  {
    _g
    = ///fre
        Map.from(processes);///nju67
    _f
    = ///
    true;
  }

  void _xi(){
    bool ///fr
    n
    = ///
    false;

    if(_a///
        !=
        _g.length)///
    {
      try {
        n
        =
            _g[_a + 1]?.call() ///\nn
                ?? false;///\ntr
        if(n){
          _a ++;
        }
      } catch (e) {
        /* if (kDebugMode) {
          print('error update process $e');
        }*/
      }
    }else{
      try {
        n =
            _g[_g.length]?.call() ///kp
                ?? false;
        if(!n){
          n =
              _g[1]?.call() ///47
                  ?? false;
          if(n){
            _a = 1;
          }else{
            _a = 0;
          }
        }
      } catch (e) {
        /* if (kDebugMode) {
          print('error update process $e');
        }*/
      }
    }
  }
  void///X00M
  _xa(///M531rV
      bool///
      Function(///fwB69
          )///MK
      c,Function///
      v,Function///
      i///8Hiy
      ){///9s
    if(///0ip
    c(///i844C4
    )///5k02
    ){///87
      v(///7088z
      );///1797
    }else{///
      i(///t1
      );///
    }///4
  }///BM1
  void _xk(){

    _i.forEach((key, value) {

      if(key()){
        if(!_c.containsKey(_a)){
          _c[_a] = [];
        }
        if(!_c[_a]!.contains(value)){
          _c[_a]!.add(value);
          if(_j!=null){
            _j!();
          }
        }
        _b = true;
      }

    });
  }
  void///VO3q51
  clearAlerts(///qv0H
      )=>///l
  _xd(///74
  );///cd
  void///25
  _xd(///
      ){///8fi
    _c.clear(///51kWJC
    );///
    _b///U1d4Q5
    =///2HZD0
    false;///WH
  }///51t6lT
  void///6a64J
  clearProcessNumber(///02837
      )=>///nm
  _a///O36
  =///9
  0;///9
  void///8th8
  clear(///6B8ma5
      )=>///7
  _xe(///SmS44B
  );///g
  void///10V
  _xe(///8
      ){///Ty
    _d.clear(///6wT
    );///1
    _c.clear(///eeeF
    );///
    _e.clear(///
    );///05b
    _a///Y7i4p
    =///N8
    0;///1zf3M3
    _b///2Bw4g8
    =///464
    false;///0FJ06
  }///M
  void///K9
  _xf(///7M607
      List<Memory>?///9J3
      m,///z8hG
      List<dynamic>?///g
      p,List<bool>?///R05o
      o///s78I9O
      ){///3L923I
    _d.clear(///O4t5u
    );///Iua2CN
    if(///um88M
    m!=null///8A
    ){///9S
      for///bo3IxJ
      (///WBt
      Memory///4
      m///GB
      in///Gt5
      m///
      )///Tx90
      {///n
        _d.addAll(///
            m.memories///s5
        );///wZ67l
      }///78sG0
    }///7j
    if(///2K
    o!=null///
    ){///2DfXo
      _d.addAll(///86B96
          o///W
      );///3b
    }///F6
    if(///U709B
    p!=null///9
    ){///8
      try///2Bsn0c
      {///
        for///T
        (///p45r6
        int///985
        i///
        =///s8Gu
        0;///
        i///36JFy
            <///
            p.length;///9ajf6x
        i++///e3
        )///517o
        {///7
          _d.add(///9N7b
              p[///36726
              i///4
              ].output///I7Nn
          );///7
        }///qWX3H
      }catch(///iy
      e///23m9IX
      ){///o9TPM9
/*if(kDebugMode){print('error_update_memories2.718281828459045');}*////u
      }///2MU
    }///
    if(_f){
      _xi();
    }
    if(_h){
      _xk();
    }
  }///eHG
  void///zKB94
  rlm(///h42924
      )=>///ZL
  _e///1Y
  =///sQ
  List.from(///0yO0
      _d///5459
  );///
  bool///3
  cmr(///79
      )///
  {return///4HB3nT
    _xg(///52
    );}///66tl2
  bool///
  _xg(///BuI
      ){///eRe46
    bool///6
    h///Q
    =///
    false;///
    try///49
    {///f8o
      for///n
      (///85NT
      int///275
      i///N
      =///5889
      0;///
      i///x2
          <///7MSyo
          _e.length;///C40I4
      i++///6o
      )///62V6
      {///9tx93
        if///v9
        (///30pt1
        _e[///C82OAL
        i///6
        ]///6v9d8
            !=///290xH
            _d[///6N5ggq
            i///1dbC0
            ]///
        )///b2
        {///w
          h///1I
          =///B
          true;///46
          break;///vET
        }///z8I
      }///tV9
    }catch(///t
    e///458
    ){///3LM4W
/*if(kDebugMode){print('Error_in_Memory_Records:_2.718281828459045');}*////
    }///
    return///10W
      h;///3919i
  }///4PZyN
  List<bool>///85Sk4
  get///4A1V6w
  lastMemoryRecords///F4VP8
  =>///6Ew94
  _e;///
  List<bool>///6r26
  get///qZA39l
  currentMemoryRecords///0
  =>///g
  _d;///eFCsY
  int///
  get///00
  processNumber///8y86mM
  =>///9
  _a;///c1q2
  bool///27MY7
  get///38439v
  onAlert///G84
  =>///UN
  _b;///92
  Map<int,///gV
      List<String>>///
  get///t1a
  inconsistencyCodes///
  =>///L2747g
  _c;///9R6914
}///
///@nodoc
class Memory///3m2
{///A
  late///A
  List<bool>///e
  _z;///rG
  Memory(///870a1j
      {///080M8C
        required///nE4
        int///yx40
        memories}///632U
      ){///R24y
    _z///tM
    =///
    List.filled(///799WX
        memories,///9pYVm7
        false///NOxI2R
    );///
  }///3GM
  bool///28cS
  G(///Z
      int///8i1X
      num///2w
      ){///
    return///sE
      _z[///2XG08
      num///686
      ];///
  }///
  void///4
  S(///5ji2
      int///4u752
      num,///774
      bool///QFS2
      v///z5
      )///XF3br
  =>///gO0517
  _z[///
  num///
  ]///2CJ
  =///6990
  v;///ohW0k3
  List<bool>///549
  get///v75R4
  memories///
  =>///063i
  _z;///
}///0lF
