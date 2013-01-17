unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UnitMil, ExtCtrls, Unit2, Unit1, modulbus;

type
  TForm7 = class(TForm)
    Button_OK: TButton;
    Button_UPDATE: TButton;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    ListBox1: TListBox;
    Button_selall: TButton;
    Button_diselall: TButton;
    procedure Button_OKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_UPDATEClick(Sender: TObject);
    procedure Button_selallClick(Sender: TObject);
    procedure Button_diselallClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form7: TForm7;

const
  IFK_ID  = $CC;
  IFK_Ver = $CD;

implementation

{$R *.DFM}

// Kopiert die vom user makierten eintraege in die IFK liste
procedure TForm7.Button_OKClick(Sender: TObject);

var index:integer;
    myIFKOnline: TStrings;

begin
    myIFKOnline:= TStringList.Create;
    myIFKOnline.Clear;
    index:= 0;

   // makierten einträge kopieren
    while (index < Listbox1.Items.Count) do begin
        if(Listbox1.Selected[index])  then begin
          myIFKOnline.Add(IFKOnline[index]);
        end;
        index:=index+1;
    end;

    IFKOnline.Clear;
    IFKOnline:= myIFKOnline;

    Form2.ListBox1.Items.Add(IntTostr(IFKOnline.Count)+' IFK selected');
    Form2.ListBox1.Items.Add('-------------------------------------------');
    Form7.Close;
end;

procedure TForm7.FormCreate(Sender: TObject);

var x,y:integer;

begin
    Scaled := true;
     x := Screen.width;
     y := Screen.height;

     if(y <> ScreenHeightDev) or (x <> ScreenWidthDev) then begin
          form7.height := (form7.clientheight * y div ScreenHeightDev)+
                           form7.height - form7.clientheight;

          form7.width  := (form7.clientwidth * x div ScreenWidthDev)+
                           form7.height - form7.clientheight;

          scaleBy(x, ScreenwidthDev);
     end;

     //IFK
     Form7.Panel2.Caption := IntToStr(IFKCount);
     Form7.ListBox1.Items.Clear;
     Form7.ListBox1.Items  := IFKOnline;

     Form7.Button_UPDATE.Click();
end;

// Sucht IFKs am bus, liest die ID, SW-Versiom und Revision aus
// sortiert  die nicht programmierbaren aus
// nicht programierbar < FA hex
// Versionen: von 15-12 Version,
//                11-08 Revision
//                07-00 nichts
procedure TForm7.Button_UPDATEClick(Sender: TObject);

var index, myIFKCount:integer;
    version,ifkid: _WORD;
    ErrorStatus, status:_DWORD;
    myIFKOnline: TStrings;
    myIFKString: String;
    myVer: Byte;
    myRev: Byte;

begin

    index:= 0;
    myIFKCount:= 0;
    ErrorStatus:= 0;
    myIFKCount:= 0;

    myIFKOnline:= TStringList.Create;
    myIFKOnline.Clear;

    // Liste loeschen
    IFKOnline.Clear;
    Form7.ListBox1.Items.Clear;

    // IFKs suchen
    IFKFound(IFKOnline, IFKCount);
    Form7.Panel2.Caption := IntToStr(IFKCount);

    // IFKs liste durchgehen & aussotieren
    while (index < IFKCount) do begin
          IFKAdress := StrToInt('$' + IFKOnline[index]);
          // IFK ID & version abfragen
          PCI_IfkRead(Cardauswahl, IFKAdress, IFK_ID, ifkid, ErrorStatus);
          PCI_IfkRead(Cardauswahl, IFKAdress, IFK_Ver, version, ErrorStatus);

          ifkid:= ifkid Shr 8;
          version:= version Shr 8;
          myVer:= version Shr 4;
          myRev:= version and $F;

          // handelt es sich um eine gesuchte -> merken
          if(ifkid >= $FA) then begin
                    myIFKCount:= myIFKCount + 1;
                     myIFKString:= IFKOnline[index]+ ' '+
                                  'ID:'+ IntToHex(ifkid, 2)+ ' '+
                                  'Nr:'+ IFK_IDCODE.Strings[ifkid]+ ' '+
                                  'Ver.:'+ IntToStr(myVer) + ' '+
                                  'Rev.:'+ IntToStr(myRev);
                    ListBox1.Items.Add(myIFKString);
                    myIFKOnline.Add(IFKOnline[index]);
                    myIFKCount:=myIFKCount + 1;
          end;
          index := index + 1;
    end;
    IFKOnline.Clear;
    IFKOnline:= myIFKOnline;
    IFKCount:= myIFKCount;
    Form7.Button_selall.Click();
end;


procedure TForm7.Button_selallClick(Sender: TObject);
begin
     Listbox1.Perform(LB_SELITEMRANGE, 1, MakeLong(0, Listbox1.Items.Count - 1));
end;

procedure TForm7.Button_diselallClick(Sender: TObject);
begin
     Listbox1.Perform(LB_SELITEMRANGE, 0, MakeLong(0, Listbox1.Items.Count - 1));
end;

end.
