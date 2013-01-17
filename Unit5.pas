unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,UnitMil, ExtCtrls, Unit2, Unit1, ComCtrls, Buttons, jpeg;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    SpeedButton1: TSpeedButton;
    Prog_Image: TImage;
    Very_Image: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form5: TForm5;

implementation

{$R *.DFM}

procedure TForm5.Button1Click(Sender: TObject);
begin
     Form5.Close;
end;

procedure TForm5.FormCreate(Sender: TObject);

var x,y:integer;
    prgTxt:string;

begin
     prgTxt:='Programming in progress.......please wait....';

     Scaled := true;
     x := Screen.Width;
     y := Screen.Height;

     if(y <> ScreenHeightDev) or (x <> ScreenWidthDev) then begin
          form5.height := (form5.clientheight * y div ScreenHeightDev)+
                           form5.height - form5.clientheight;

          form5.width  := (form5.clientwidth * x div ScreenWidthDev)+
                           form5.height - form5.clientheight;

          scaleBy(x, ScreenwidthDev);
     end;

{     if(Form2.RadioButton2.Checked) then begin
       Form5.Label1.Caption:='IFKNr.: ' + IntToStr(IFKAdress)+' '+prgTxt;
       Form5.Update;
     end else Form5.Label1.Caption:= prgTxt;   }

     Form5.Label1.Caption:= prgTxt;
     Form5.Update;

end;

end.
