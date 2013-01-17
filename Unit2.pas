unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, UnitMil, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    Option1: TMenuItem;
    Abour1: TMenuItem;
    IFKAuswhlen1: TMenuItem;
    Info1: TMenuItem;
    Button4: TButton;
    Panel1: TPanel;
    D1: TMenuItem;
    Laden1: TMenuItem;
    N5: TMenuItem;
    Exit1: TMenuItem;
    ListBox1: TListBox;
    Label1: TLabel;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    UserSave: TRadioButton;
    Failsave: TRadioButton;
    SendUserFailSave: TButton;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    N1: TMenuItem;
    ReadCommandoStatReg1: TMenuItem;
    Panel4: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SaveDialog1: TSaveDialog;
    Extra1: TMenuItem;
    ReadFlashSave1: TMenuItem;
    Button1: TButton;
    procedure IFKAuswhlen1Click(Sender: TObject);
    procedure ReadWriteFCTCodesndern1Click(Sender: TObject);
    procedure SingelStep1Click(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Laden1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SendUserFailSaveClick(Sender: TObject);
    procedure ReadCommandoStatReg1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure ReadFlashSave1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

  WriteMilBusTimeOutC:integer;
  ReadMilBusTimeOutC:integer;
  VerifyFailtC:integer;
  FID:integer;

  LoopCounter:longint;
  SendCounter:longint;
  IFKAdress:Byte;
  MBKAdress:Byte;
  SendData:integer;
  FktRead:Byte;
  FktWrite:Byte;

  IFKOnline: TStrings;
  IFKCount:integer;
  IFKOnlineIndex:integer;

  MBKOnline: TStrings;
  MBKOnlineNr:TStrings;
  MBKCount:integer;
  MBKOnlineIndex:integer;

  MDK_IDCODE:TStrings;
  IFK_IDCODE:TStrings;

  dateiname     :string;
  Savedateiname :string;
  buffer        :string;
  FileByte      :file of Byte;
  SaveFileByte  :file of Byte;
  ConfigFileSize    :DWORD;

  AuswahlKickerKarte:boolean;

implementation

uses Unit3, Unit4, Unit5, Unit1, Unit6, Unit7, modulbus;

{$R *.DFM}

// Menue IFK Auswahl
procedure TForm2.IFKAuswhlen1Click(Sender: TObject);
begin
     if(RadioButton1.Checked = true)  then begin
          Application.CreateForm(TForm3, Form3);
          Form3.Show;
     end else begin
          Application.CreateForm(TForm7, Form7);
          Form7.Show;
     end;
end;

// Menue Read/Write
procedure TForm2.ReadWriteFCTCodesndern1Click(Sender: TObject);
begin
     Application.CreateForm(TForm4, Form4);
     Form4.Show;
end;

// Menue SingelStep
procedure TForm2.SingelStep1Click(Sender: TObject);
begin
     Application.CreateForm(TForm5, Form5);
     Form5.Show;
end;

// Menue BEENDEN
procedure TForm2.Beenden1Click(Sender: TObject);
begin
     // Bye...bye...
     Form2.Close;
     Form1.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);

var x,y:integer;


begin
     Scaled := true;
     x := Screen.width;
     y := Screen.height;

     if(y <> ScreenHeightDev) or (x <> ScreenWidthDev) then begin
          form2.height := (form2.clientheight * y div ScreenHeightDev)+
                           (form2.height - form2.clientheight);

          form2.width  := (form2.clientwidth * x div ScreenWidthDev)+
                           (form2.height - form2.clientheight);

          scaleBy(x, ScreenwidthDev);
     end;


     IFKCount:= 0;
     MBKCount:= 0;

     IFKOnline  := TStringList.Create;
     MBKOnline  := TStringList.Create;
     MBKOnlineNr:= TStringList.Create;
     MDK_IDCODE := TStringList.Create;
     IFK_IDCODE := TStringList.Create;

     x:=0;
     repeat
           MDK_IDCODE.Add('UNDEFINED');
           IFK_IDCODE.Add('UNDEFINED');
           x:=x+1;
     until(x=256);

     MDK_IDCODE.Insert(1,'FG 352.150 FIB');
     MDK_IDCODE.Insert(31,'FG 450.311 Schaltkarte');
     MDK_IDCODE.Insert(32,'FG 450.320 Digital I/O');
     MDK_IDCODE.Insert(33,'FG 450.330 Statuskarte');
     MDK_IDCODE.Insert(34,'FG 450.342 Analog I/O');
     MDK_IDCODE.Insert(35,'FG 450.350 EXEV');
     MDK_IDCODE.Insert(36,'FG 450.362 MB32B');
     MDK_IDCODE.Insert(37,'FG 450.370 EvSEQ');
     MDK_IDCODE.Insert(38,'FG 450.380 GPGEN');
     MDK_IDCODE.Insert(39,'FG 450.390 MB64B');
     MDK_IDCODE.Insert(40,'FG 450.400 MBDAAD');
     MDK_IDCODE.Insert(41,'FG 450.410 Kicker-Counter');
     MDK_IDCODE.Insert(42,'FG 450.420 Trigger');

     IFK_IDCODE.Insert(250,'FG 380.221');
     IFK_IDCODE.Insert(251,'FG 380.211');
     IFK_IDCODE.Insert(252,'FG 380.203');
     IFK_IDCODE.Insert(253,'FG 450.012');
     IFK_IDCODE.Insert(254,'FG 380.201');



     FID := 0;

     if(RadioButton1.Checked) then AuswahlKickerKarte:=true
     else AuswahlKickerKarte:=false;

    // IFKs suchen
    IFKFound(IFKOnline, IFKCount);

    // Erste IFK nehmen
    try
       IFKAdress := StrToInt('$' + IFKOnline[0]);
       IFKOnlineIndex := 0;
    except
       IFKAdress := 0;
    end;

    //MBK suchen
    y:= 0;
    MBKFound(MBKOnline, MBKOnlineNr, MBKCount);

    // Erste MBK nehmen
    if(IFKAdress > 0) then begin
        try
           MBKAdress := StrToInt('$' + MBKOnlineNr[0]);
           MBKOnlineIndex := 0;
        except
           MBKAdress := 0;
        end
    end else MBKAdress := 0;






{    if(MBKCount = 0) then messagebox(0,'Keine MBK gefunden !','Warnung',16)
    else begin
         if(MBKCount = 1) then begin
           MBKAdress:= StrToInt('$' + MBKOnlineNr[0]);
           end
         else begin
           Application.CreateForm(TForm3, Form3);
           Form3.Show;
         end
    end;}

{    if(MBKCount <> 0) then begin
         x:=0;
         repeat
               y:= StrToInt(MBKOnlineNr[x]);
               x:=x+1;
         until (y=4) or (x=MBKCount);

         if(y=4) then begin
            MBKOnlineIndex:= x-1;
            MBKAdress:= StrToInt('$' + MBKOnlineNr[MBKOnlineIndex]);
            end
    end;          }

    // Kommando Satusreg vom kicker pruefen ob Reload User oder Failsave gesetzt ist
    if (MOD_CommStatusTest(mod_cstat_reload_user) = true) then Form2.UserSave.Checked := true
    else if (MOD_CommStatusTest(mod_cstat_reload_failsave) = true) then Form2.FailSave.Checked := true
end;

// INFO
procedure TForm2.Info1Click(Sender: TObject);
begin
     Application.CreateForm(TForm6, Form6);
     Form6.Show;
end;

// EXIT
procedure TForm2.Button4Click(Sender: TObject);
begin
     // Bye...bye...
     if dateiname <> '' then CloseFile(FileByte);

     Form2.Close;
     Form1.Close;
end;

// Close Form 3
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);

begin
      // Treiber schliessen
     PCI_DriverClose(Cardauswahl);

     // Bye...bye...
     Form1.Close;
end;


// Flash file laden
procedure TForm2.Laden1Click(Sender: TObject);
begin
     if OpenDialog1.Execute then begin
        dateiname := OpenDialog1.FileName;
        AssignFile(FileByte, dateiname);
        {$i-}
             Reset(FileByte);
        {$i+}
        if IOResult = 0 then begin
           ListBox1.Items.Add('OK ! Read file ');
           ListBox1.Items.Add(dateiname);
           ConfigFileSize := FileSize(FileByte)
           end;
        end
     else begin
         ListBox1.Items.Add('ERROR ! Read file');
         dateiname := '';
     end
end;

// Clear Listbox1
procedure TForm2.Button2Click(Sender: TObject);
begin
     ListBox1.Clear();
end;

// Burn
procedure TForm2.SpeedButton1Click(Sender: TObject);

var index: integer;

begin

     if (Form2.SpeedButton1.Down = true) and (dateiname <> '') and (IFKCount<> 0) then begin
        ListBox1.TopIndex:=ListBox1.Items. Add('Programming in progress ! Please wait....');
        Form2.Update;
        Application.ProcessMessages;

        // Kicker programmieren
        if (Form2.RadioButton1.Checked) then begin
           if (UserFlashprog(ListBox1)=true) then ListBox1.Items.Add('OK ! Programmierung erfolgreich !')
           else ListBox1.Items.Add('ERROR ! Ein Fehler ist beim programmieren aufgetreten !');
        end;

        // IFK programmieren
        if(Form2.RadioButton2.Checked) then begin
          if(IFKOnline.Count > 0) then begin
            index:= 0;
            while (index < IFKOnline.Count) do begin
                IFKAdress := StrToInt('$'+IFKOnline[index]);
                if (UserFlashprog(ListBox1)=true) then ListBox1.Items.Add('OK ! IFKNr.:'+IFKOnline[index]+' Programmierung erfolgreich !')
                else ListBox1.Items.Add('ERROR ! Ein Fehler ist beim programmieren aufgetreten !');
                index:=index + 1;
            end;
          end else ListBox1.Items.Add('nothing to do');
        end;

        ListBox1.TopIndex:=ListBox1.Items. Add('-------------------------------------------');
        Form2.SpeedButton1.Down := False;

        // Kommando Satusreg vom kicker pruefen ob Reload User oder Failsave gesetzt ist
        if (MOD_CommStatusTest(mod_cstat_reload_user) = true) then Form2.UserSave.Checked := true
        else if (MOD_CommStatusTest(mod_cstat_reload_failsave) = true) then Form2.FailSave.Checked := true
     end;

     if (dateiname = '') or (IFKCount = 0) then begin
        ListBox1.Items.Add('nothing to do');
        Form2.SpeedButton1.Down := False;
     end;
end;

// Verify
procedure TForm2.SpeedButton2Click(Sender: TObject);

var index:integer;

begin
     if (Form2.SpeedButton1.Down = true) then begin
        Form2.SpeedButton2.Down := False;
        end
     else if(Form2.SpeedButton2.Down = true) and (dateiname <> '') and (IFKCount<> 0) then begin
         ListBox1.TopIndex:=ListBox1.Items. Add('Verification in progress ! Please wait....');
         Form2.Update;
         Application.ProcessMessages;

         // IFK ueberpruefen
         if(Form2.RadioButton2.Checked) then begin
            if(IFKOnline.Count > 0) then begin
              index:= 0;
              while (index < IFKOnline.Count) do begin
                   IFKAdress := StrToInt('$'+IFKOnline[index]);
                   if(UserFlashVerify(ListBox1) = true) then ListBox1.Items.Add('OK ! IFKNr.:'+IFKOnline[index]+' Verification erfolgreich !')
                   else ListBox1.Items.Add('ERROR ! '+IFKOnline[index]+' Verification fehlgeschlagen !');
                   index:=index+1;
              end;
            end else ListBox1.Items.Add('nothing to do');

         // KickerKacker ueberpruefen
         end else begin;
            if(UserFlashVerify(ListBox1) = true) then ListBox1.Items.Add('OK ! Verification erfolgreich !')
            else ListBox1.Items.Add('ERROR ! Verification fehlgeschlagen !');
         end;

        ListBox1.TopIndex:=ListBox1.Items. Add('-------------------------------------------');
        Form2.SpeedButton2.Down := False;

        // Kommando Satusreg vom kicker pruefen ob Reload User oder Failsave gesetzt ist
        if (MOD_CommStatusTest(mod_cstat_reload_user) = true) then Form2.UserSave.Checked := true
        else if (MOD_CommStatusTest(mod_cstat_reload_failsave) = true) then Form2.FailSave.Checked := true
     end;

     if (dateiname = '') or (IFKCount = 0) then begin
        ListBox1.Items.Add('nothing to do');
        Form2.SpeedButton2.Down := False;
        end;
end;

// Send User oder Fail save
procedure TForm2.SendUserFailSaveClick(Sender: TObject);

var ErrStatus : _DWORD;
    MessageStr  : string;
    index:integer;

begin
    ErrStatus := 0;
    MessageStr := '';

    if (Form2.UserSave.Checked = true) then begin

       // IFKs umschalten
       if(AuswahlKickerKarte = false) then begin
          if(IFKOnline.Count > 0) then begin
            index:=0;
            while (index < IFKOnline.Count) do begin
                IFKAdress := StrToInt('$'+IFKOnline[index]);
                modulbus_adr_wr(mod_cstat_reload_user, ifk_comm_status_wr, MBKAdress, IFKAdress,ErrStatus);
                index:=index + 1;
            end;
          end else ListBox1.Items.Add('nothing to do');

       // KickerKake umschalten
       end else modulbus_adr_wr(mod_cstat_reload_user, mod_comm_status, MBKAdress, IFKAdress,ErrStatus);

       PCI_TimerWait(Cardauswahl, 1500, 1, ErrStatus);
       if(ErrStatus = 0) then begin
          MessageStr := 'OK ! Send UserSave !';
          if not(MOD_CommStatusTest(mod_cstat_reload_user)) then MessageStr := MessageStr + ' ! ERROR ! Umschaltung fehlgeschlagen !';
          end
       else MessageStr := 'ERROR ! Send UserSave !'
       end

    else if(Form2.Failsave.Checked = true) then begin

       //IFKs umschalten
       if(AuswahlKickerKarte = false) then begin
          if(IFKOnline.Count > 0) then begin
            index:=0;
            while (index < IFKOnline.Count) do begin
                IFKAdress := StrToInt('$'+IFKOnline[index]);
                modulbus_adr_wr(mod_cstat_reload_failsave, ifk_comm_status_wr, MBKAdress, IFKAdress,ErrStatus);
                index:=index+1;
            end;
          end else ListBox1.Items.Add('nothing to do');

       //  KickerKake umschalten
       end else modulbus_adr_wr(mod_cstat_reload_failsave, mod_comm_status, MBKAdress, IFKAdress,ErrStatus);

       PCI_TimerWait(Cardauswahl, 1500, 1, ErrStatus);
       if(ErrStatus = 0) then begin
          MessageStr := 'OK ! Send FailSave !';
          if not(MOD_CommStatusTest(mod_cstat_reload_failsave)) then MessageStr := MessageStr + ' ! ERROR ! Umschaltung fehlgeschlagen !';
          end
       else MessageStr := 'ERROR ! Send FailSave !';
    end;

    if (MessageStr = '') then MessageStr := 'WHAT ? What Do you want ?';
    ListBox1.TopIndex:=ListBox1.Items. Add(MessageStr);
    ListBox1.TopIndex:=ListBox1.Items. Add('-------------------------------------------');
    Form2.Update;
end;

procedure TForm2.ReadCommandoStatReg1Click(Sender: TObject);
begin
     Application.CreateForm(TForm4, Form4);
     Form4.Show;
end;

procedure TForm2.RadioButton1Click(Sender: TObject);
begin
     AuswahlKickerKarte:= true;
     Form2.RadioButton1.Font.Color := clRed;
     Form2.RadioButton2.Font.Color := clWindowText;
end;

procedure TForm2.RadioButton2Click(Sender: TObject);
begin
     AuswahlKickerKarte:=false;
     Form2.RadioButton1.Font.Color := clWindowText;
     Form2.RadioButton2.Font.Color := clRed;
end;


procedure TForm2.ReadFlashSave1Click(Sender: TObject);
begin
     // Save dialog oeffnen
     if SaveDialog1.Execute then begin
        Savedateiname := SaveDialog1.FileName;
        AssignFile(SaveFileByte, Savedateiname);
        ReWrite(SaveFileByte);
        if IOResult = 0 then begin
           ListBox1.Items.Add('OK ! Open Savefile');
           ConfigFileSize := FileSize(SaveFileByte)
           end;
     end else begin
        ListBox1.Items.Add('ERROR ! Open Savefile');
        Savedateiname:= '';
        end;

     if(Savedateiname <> '') then begin

        ListBox1.TopIndex:=ListBox1.Items. Add('Reading in progress ! Please wait....');
        Form2.Update;
        Application.ProcessMessages;

        if(UserFlashRead(ListBox1) = true) then ListBox1.Items.Add('OK ! Reading Flash Success !')
        else ListBox1.Items.Add('ERROR ! Lesen fehlgeschlagen !');

        CloseFile(SaveFileByte);
        ListBox1.TopIndex:=ListBox1.Items. Add('-------------------------------------------');
        end;



end;
procedure TForm2.Button1Click(Sender: TObject);

var ErrStatus:_DWORD;

begin
     ListBox1.TopIndex:=ListBox1.Items. Add('-------------------------------------------');
     ListBox1.TopIndex:=ListBox1.Items. Add('Start to programm and verifying all IFKs on bus... ');
     ListBox1.TopIndex:=ListBox1.Items. Add('---');

     // ----- Programmiere karten --------
     Form2.SpeedButton1.Down:= true;
     Form2.SpeedButton1.Click();
     Form2.SpeedButton1.Down:= false;
     Form2.Update;

     // ------- wait ----------
     PCI_TimerWait(Cardauswahl, 800, 1, ErrStatus);

     // ---- verify ----
     Form2.SpeedButton2.Down:= true;
     Form2.SpeedButton2.Click();
     Form2.SpeedButton2.Down:= false;
     Form2.Update;

     // ------- wait ----------
     PCI_TimerWait(Cardauswahl, 800, 1, ErrStatus);

     // ---- auf user mode umschalten ----
     Form2.Failsave.Checked := False;
     Form2.Usersave.Checked := true;
     Form2.SendUserFailSave.Click;
     Form2.Update;

     ListBox1.TopIndex:=ListBox1.Items. Add('---');
     ListBox1.TopIndex:=ListBox1.Items. Add('End of process....');
     ListBox1.TopIndex:=ListBox1.Items. Add('-------------------------------------------');
end;

end.
