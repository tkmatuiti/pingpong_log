import 'package:flutter/material.dart';
import 'package:tt_diary/screens/edit_account-pagae.dart';
// PreferredSizeWidget：最適なサイズに変更するウィジェット
// preferredSize：制約がないときに設定するデフォルトサイズ
// Size.fromHeight：指定された高さでsizeを作成
// kToolbarHeight：appBarの高さの定数

class Header extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('ホーム'),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: UserIcon(),
      )
    );
  }
}

class UserIcon extends StatefulWidget{
  @override
  _UserIcon createState()=> _UserIcon();
  }

// CircleAvatarを使うと画像を丸くしてくれる
// CircleAvatarはonTapイベントに対応していない
// Stackでウィジェットを重ねれれば両方実現できる
class _UserIcon extends State{
  @override
  Widget build(BuildContext context){
    return Stack(//CircleAvatarとRawMaterialButtonを重ねている。
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('assets/icon/sotaro_icon.png'),
          radius: 60.0,
        ),
        RawMaterialButton(
          child: Container(
            width: 120.0,
            height: 120.0,
          ),
          shape: const CircleBorder(),
          elevation: 0,
            onPressed: (){
            Navigator.push<Route>(context,
                  MaterialPageRoute(builder: (context) => EditAccountPage()));
            }//todo UserProfieleに遷移
            ),
      ],
    );
}

}