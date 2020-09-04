import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:pkcoins/slider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Crypto '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client httpClient;
  Web3Client ethClient;
  bool data = false;
  int myAmount = 0;

  final myAddress = "0x11723c28A1D69ED2e52F0e3c28b621d9EBc513dC";
  var myData;

  @override
  void initState() {
    super.initState();
    httpClient = Client();
    ethClient = Web3Client(
        'https://ropsten.infura.io/v3/563585017915486fb40190268ae87914',
        httpClient);
    getBalance(myAddress);
  }

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0x8a26Fc21D7b11365121153f3B014531B65e8a41f";

    final contract = DeployedContract(ContractAbi.fromJson(abi, "Crypto"),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<void> getBalance(String targetAddress) async {
    // EthereumAddress address = EthereumAddress.fromHex(targetAddress);
    List<dynamic> result = await query("getBalance", []);
    myData = result[0];
    data = true;
    setState(() {});
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex(
        'd86a5a13f23e56c71934667ab7811da21932359a03073f41b2710d87600caf1f');
    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
          contract: contract, function: ethFunction, parameters: args),
      fetchChainIdFromNetworkId: true,
    );
    return result;
  }

  Future<String> sendCoin() async {
    var bigAmount = BigInt.from(myAmount);
    var response = await submit('depositBalance', [bigAmount]);
    print("deposited");
    return response;
  }

  Future<String> withdrawCoin() async {
    var bigAmount = BigInt.from(myAmount);
    var response = await submit('withdrawBalance', [bigAmount]);
    print("withdrawn");
    return response;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray300,
      body: ZStack([
        VxBox()
            .blue600
            .size(context.screenWidth, context.percentHeight * 30)
            .make(),
        VStack([
          (context.percentHeight * 10).heightBox,
          "\$CRYPTO".text.xl4.white.bold.center.makeCentered().py16(),
          (context.percentHeight * 5).heightBox,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: VxBox(
                    child: VStack([
              "Balance".text.black.xl2.semiBold.makeCentered(),
              10.heightBox,
              data
                  ? "$myData".text.bold.xl6.makeCentered()
                  : CircularProgressIndicator().centered(),
            ]))
                .p16
                .white
                .size(context.screenWidth, context.percentHeight * 20)
                .rounded
                .shadowXl
                .alignCenter
                .p16
                .make(),
          ),
          30.heightBox,
          SliderWidget(
            min: 0,
            max: 100,
            finalVal: (value) {
              myAmount = (value * 100).round();
              print(myAmount);
            },

            // finalVal: (value) {
            //   setState(() {
            //     myAmount = (value * 100).round();
            //   });

            //   print(myAmount);
            //   print("hell");
            // },
          ).centered(),
          HStack(
            [
              FlatButton.icon(
                      onPressed: () => getBalance(myAddress),
                      color: Colors.blue,
                      shape: Vx.roundedSm,
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      label: "refresh".text.white.make())
                  .h(50),
              FlatButton.icon(
                      onPressed: () => sendCoin(),
                      color: Colors.green,
                      shape: Vx.roundedSm,
                      icon: Icon(
                        Icons.call_made,
                        color: Colors.white,
                      ),
                      label: "deposit".text.white.make())
                  .h(50),
              FlatButton.icon(
                      onPressed: () => withdrawCoin(),
                      color: Colors.red,
                      shape: Vx.roundedSm,
                      icon: Icon(
                        Icons.call_received,
                        color: Colors.white,
                      ),
                      label: "withdraw".text.white.make())
                  .h(50),
            ],
            alignment: MainAxisAlignment.spaceAround,
            axisSize: MainAxisSize.max,
          ).p16(),
        ])
      ]),
    );
  }
}
