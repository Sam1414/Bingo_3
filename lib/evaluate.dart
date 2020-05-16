import './box.dart';
import './linesCut.dart';

class Evaluate {
  List<box> b;
  LinesCut lc;

  Evaluate(this.b, this.lc) {
    lc.cutLines = 0;
    checkRow();
    checkCol();
    checkDiag();
  }

  checkRow() {
    for (int i = 0; i < 5; i++) {
      bool anding = true;
      for (int j = 0; j < 5; j++) {
        var ind = (i * 5) + j;
        anding = anding & b[ind].cut;
      }
      if (anding == true) {
        lc.cutLines++;
      }
    }
  }

  checkCol() {
    for (int i = 0; i < 5; i++) {
      bool anding = true;
      for (int j = 0; j < 5; j++) {
        var ind = (j * 5) + i;
        anding = anding & b[ind].cut;
        print('anding: $anding');
      }
      if (anding == true) {
        lc.cutLines++;
      }
    }
  }

  checkDiag() {
    if ((b[0].cut & b[6].cut & b[12].cut & b[18].cut & b[24].cut) == true) {
      lc.cutLines++;
    }
    if ((b[4].cut & b[8].cut & b[12].cut & b[16].cut & b[20].cut) == true) {
      lc.cutLines++;
    }
  }
}
