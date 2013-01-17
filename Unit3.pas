unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UnitMil, ExtCtrls, Unit2, Unit1, modulbus;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    ListBox1: TListBox;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Button2: TButton;
    Panel3: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel4: TPanel;
    ListBox2: TListBox;
    ComboBox2: TComboBox;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form3: TForm3;

implementation

{$R *.DFM}

procedure TForm3.Button1Click(Sender: TObject);
begin
     Form3.Close;
end;

procedure TForm3.FormCreate(Sender: TObject);

var x,y:integer;

begin
     Scaled := true;
     x := Screen.width;
     y := Screen.height;

     if(y <> ScreenHeightDev) or (x <> ScreenWidthDev) then begin
          form3.height := (form3.clientheight * y div ScreenHeightDev)+
                           form3.height - form3.clientheight;

          form3.width  := (form3.clientwidth * x div ScreenWidthDev)+
                           form3.height - form3.clientheight;

          scaleBy(x, ScreenwidthDev);
     end;

     // IFks update
     Button2.Click;
     //MBK update
     Button3.Click;


{     //IFK
     Form3.Panel2.Caption := IntToStr(IFKCount);
     Form3.ListBox1.Items.Clear;
     Form3.ListBox1.Items  := IFKOnline;

     Form3.ComboBox1.Items.Clear;
     Form3.ComboBox1.Items     := IFKOnline;
     Form3.ComboBox1.ItemIndex := IFKOnlineIndex;

     //MBK
     Form3.Panel4.Caption := IntToStr(MBKCount);
     Form3.ListBox2.Items.Clear;
     Form3.ListBox2.Items  := MBKOnline;

     Form3.ComboBox2.Items.Clear;
     Form3.ComboBox2.Items     := MBKOnlineNr;
     Form3.ComboBox2.ItemIndex := MBKOnlineIndex;

     //Felder abschaltung
     if(AuswahlKickerKarte = true) then begin
          Form3.ListBox2.Enabled  := true;
          Form3.ComboBox2.Enabled := true;
          Form3.Button3.Enabled   := true;
     end else begin
          Form3.ListBox2.Enabled  := false;
          Form3.ComboBox2.Enabled := false;
          Form3.Button3.Enabled   := false;
     end;           }
end;


// UPDATE IFK
procedure TForm3.Button2Click(Sender: TObject);

begin
    // Liste loeschen
    IFKOnline.Clear;

    // IFKs suchen
    IFKFound(IFKOnline, IFKCount);

    Form3.ListBox1.Items.Clear;
    Form3.ListBox1.Items  := IFKOnline;
    Form3.Panel2.Caption  := IntToStr(IFKCount);

    Form3.ComboBox1.Items.Clear;
    Form3.ComboBox1.Items     := IFKOnline;
    Form3.ComboBox1.ItemIndex := 0;
    IFKOnlineIndex := 0;

    // Auswahl IFK aussuchen
    try
       IFKAdress := StrToInt('$'+ Form3.ComboBox1.Text);
    except
       messagebox(0,'Keine IFK gefunden !','Warnung',16);
    end;
end;

// IFK select click !
procedure TForm3.ComboBox1Change(Sender: TObject);
begin
     IFKOnlineIndex := Form3.ComboBox1.ItemIndex;

     try
        IFKAdress := StrToInt('$'+ Form3.ComboBox1.Text);
     except
        messagebox(0,'Ungültige IFK !','Warnung',16);
     end;
end;

//UPDATE MBK
procedure TForm3.Button3Click(Sender: TObject);

begin
    // Liste loeschen
    MBKOnline.Clear;
    MBKOnlineNr.Clear;

    // IFKs suchen
    MBKFound(MBKOnline, MBKOnlineNr, MBKCount);

    Form3.ListBox2.Items.Clear;
    Form3.ListBox2.Items  := MBKOnline;
    Form3.Panel4.Caption  := IntToStr(MBKCount);

    Form3.ComboBox2.Items.Clear;
    Form3.ComboBox2.Items     := MBKOnlineNr;
    Form3.ComboBox2.ItemIndex := 0;
    MBKOnlineIndex := 0;

    // Auswahl IFK aussuchen
    try
       MBKAdress := StrToInt('$'+ Form3.ComboBox2.Text);
    except
       messagebox(0,'Keine MBK gefunden !','Warnung',16);
    end;
end;

// MBK select click !
procedure TForm3.ComboBox2Change(Sender: TObject);
begin
     MBKOnlineIndex := Form3.ComboBox2.ItemIndex;

     try
        MBKAdress := StrToInt('$'+ Form3.ComboBox2.Text);
     except
        messagebox(0,'Ungültige MBK !','Warnung',16);
     end;
end;

end.
