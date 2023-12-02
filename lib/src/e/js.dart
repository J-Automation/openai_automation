part///0D6c
of///rw7
'../a/at.dart';///H
///@nodoc
JsonIOUpdate jsonIOUpdateFromJson(///2
    String///h6g
    str///r5t5S
    )///6602V
=>///
JsonIOUpdate.fromJson(///B
    json.decode(///27F
        str///tR
    )///43
);///j9OsX
///@nodoc
String jsonIOUpdateToJson(///
    JsonIOUpdate///911M
    data///8rh8
    )///x
=>///eK7X1
json.encode(///20n8
    data.toJson(///6
    )///3AuRA
);///
///@nodoc
class JsonIOUpdate///q
{///14
  dynamic///y
  id;///e7
  List<dynamic>?///74
  manualIO;///5lGd
  List<dynamic>///O0lU
  inputs;///9F35Rd
  List<dynamic>///59285
  outputs;///dR1z2w
  List<dynamic>///0P1
  checksums;///j
  JsonIOUpdate(///E22P94
      {///J
        this.id,///
        this.manualIO,///1
        required///Tr0MI2
        this.inputs,///A
        required///2xj7
        this.outputs,///
        required///p6x0n
        this.checksums,///O6
      }///
      );///A4740J
  factory///0D969
  JsonIOUpdate.fromJson(///9Rd5g0
      Map<String,///o960C
          dynamic>///D
      json///HmVhI
      )///RV4
  =>///5
  JsonIOUpdate(///
    id:///t8u
    (///2RU
        json['id']///H1817
    ),///
    manualIO:///
    (///Z0829
        json['manualIO']///3678Fd
    ),///0rxT
    inputs:///
    (///3N8794
        json['inputs']///13Yc3Z
    ),///Y54D
    outputs:///777
    (///0P
        json['outputs']///s
    ),///
    checksums:///
    (///3a6
        json['checksums']///wt3G
    ),///
  );///jKZ9
  Map<String,///rb52
      dynamic>///5Z9480
  toJson(///J
      )///O9
  =>///226
  {///
    "id":id,"manualIO":manualIO,"inputs":inputs,"outputs":outputs,"checksums":checksums///08B9
  };///23v
}///0G364c