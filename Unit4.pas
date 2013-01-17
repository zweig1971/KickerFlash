unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,UnitMil, ExtCtrls, Unit2, Unit1;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    ExitButton: TButton;
    RdStatRegButton: TButton;
    StatusRegOutBinPanel: TPanel;
    StatusRegOutHexPanel: TPanel;
    StatusRegOutDecPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    D0_Shape: TShape;
    Label5: TLabel;
    Label6: TLabel;
    D1_Shape: TShape;
    D2_Shape: TShape;
    Label7: TLabel;
    D3_Shape: TShape;
    Label8: TLabel;
    D4_Shape: TShape;
    Label9: TLabel;
    D5_Shape: TShape;
    Label10: TLabel;
    D6_Shape: TShape;
    Label11: TLabel;
    D7_Shape: TShape;
    Label12: TLabel;
    D8_Shape: TShape;
    Label13: TLabel;
    D9_Shape: TShape;
    Label14: TLabel;
    D10_Shape: TShape;
    Label15: TLabel;
    D11_Shape: TShape;
    Label16: TLabel;
    D12_Shape: TShape;
    Label17: TLabel;
    D13_Shape: TShape;
    Label18: TLabel;
    D14_Shape: TShape;
    Label19: TLabel;
    D15_Shape: TShape;
    Label20: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure RdStatRegButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure ClearForm();
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form4: TForm4;

implementation

uses modulbus;

{$R *.DFM}

procedure TForm4.FormCreate(Sender: TObject);

var x,y:integer;


begin
     Scaled := true;
     x := Screen.width;
     y := Screen.height;

     if(y <> ScreenHeightDev) or (x <> ScreenWidthDev) then begin
          form4.height := (form4.clientheight * y div ScreenHeightDev)+
                           form4.height - form4.clientheight;

          form4.width  := (form4.clientwidth * x div ScreenWidthDev)+
                           form4.height - form4.clientheight;

          scaleBy(x, ScreenwidthDev);
     end;

     ClearForm();

end;

procedure TForm4.ClearForm();
begin
     Form4.StatusRegOutBinPanel.Caption := '-';
     Form4.StatusRegOutHexPanel.Caption := '-';
     Form4.StatusRegOutDecPanel.Caption := '-';

     Form4.D15_Shape.Brush.Color := clWhite;
     Form4.D14_Shape.Brush.Color := clWhite;
     Form4.D13_Shape.Brush.Color := clWhite;
     Form4.D12_Shape.Brush.Color := clWhite;
     Form4.D11_Shape.Brush.Color := clWhite;
     Form4.D10_Shape.Brush.Color := clWhite;
     Form4.D9_Shape.Brush.Color := clWhite;
     Form4.D8_Shape.Brush.Color := clWhite;
     Form4.D7_Shape.Brush.Color := clWhite;
     Form4.D6_Shape.Brush.Color := clWhite;
     Form4.D5_Shape.Brush.Color := clWhite;
     Form4.D4_Shape.Brush.Color := clWhite;
     Form4.D3_Shape.Brush.Color := clWhite;
     Form4.D2_Shape.Brush.Color := clWhite;
     Form4.D1_Shape.Brush.Color := clWhite;
     Form4.D0_Shape.Brush.Color := clWhite;
end;


// Read Status Register
procedure TForm4.RdStatRegButtonClick(Sender: TObject);

var Status :_WORD;
    ErrStatus :_DWORD;
    StrBuff   : string;

begin
     Status    := 0;
     ErrStatus := 0;

     ClearForm();

     modulbus_adr_rd(Status, mod_comm_status, MBKAdress, IFKAdress, ErrStatus);

     if(ErrStatus = 0) then begin
       StrBuff := intToBinary(Status,16);
       Form4.StatusRegOutBinPanel.Caption := StrBuff;
       Form4.StatusRegOutHexPanel.Caption := IntToHex(Status,4);
       Form4.StatusRegOutDecPanel.Caption := IntToStr(Status);

       if(StrBuff[1] = '1') then Form4.D15_Shape.Brush.Color := clGreen
       else Form4.D15_Shape.Brush.Color := clWhite;

       if(StrBuff[2] = '1') then Form4.D14_Shape.Brush.Color := clGreen
       else Form4.D14_Shape.Brush.Color := clWhite;

       if(StrBuff[3] = '1') then Form4.D13_Shape.Brush.Color := clGreen
       else Form4.D13_Shape.Brush.Color := clWhite;

       if(StrBuff[4] = '1') then Form4.D12_Shape.Brush.Color := clGreen
       else Form4.D12_Shape.Brush.Color := clWhite;

       if(StrBuff[5] = '1') then Form4.D11_Shape.Brush.Color := clGreen
       else Form4.D11_Shape.Brush.Color := clWhite;

       if(StrBuff[6] = '1') then Form4.D10_Shape.Brush.Color := clGreen
       else Form4.D10_Shape.Brush.Color := clWhite;

       if(StrBuff[7] = '1') then Form4.D9_Shape.Brush.Color := clGreen
       else Form4.D9_Shape.Brush.Color := clWhite;

       if(StrBuff[8] = '1') then Form4.D8_Shape.Brush.Color := clGreen
       else Form4.D8_Shape.Brush.Color := clWhite;

       if(StrBuff[9] = '1') then Form4.D7_Shape.Brush.Color := clGreen
       else Form4.D7_Shape.Brush.Color := clWhite;

       if(StrBuff[10] = '1') then Form4.D6_Shape.Brush.Color := clGreen
       else Form4.D6_Shape.Brush.Color := clWhite;

       if(StrBuff[11] = '1') then Form4.D5_Shape.Brush.Color := clGreen
       else Form4.D5_Shape.Brush.Color := clWhite;

       if(StrBuff[12] = '1') then Form4.D4_Shape.Brush.Color := clGreen
       else Form4.D4_Shape.Brush.Color := clWhite;

       if(StrBuff[13] = '1') then Form4.D3_Shape.Brush.Color := clGreen
       else Form4.D3_Shape.Brush.Color := clWhite;

       if(StrBuff[14] = '1') then Form4.D2_Shape.Brush.Color := clGreen
       else Form4.D2_Shape.Brush.Color := clWhite;

       if(StrBuff[15] = '1') then Form4.D1_Shape.Brush.Color := clGreen
       else Form4.D1_Shape.Brush.Color := clWhite;

       if(StrBuff[16] = '1') then Form4.D0_Shape.Brush.Color := clGreen
       else Form4.D0_Shape.Brush.Color := clWhite;

       end
     else Application.MessageBox('Fehler beim lesen des Statusregister', 'Mist', 16);
end;


procedure TForm4.ExitButtonClick(Sender: TObject);
begin
     Form4.Close;
end;

end.
