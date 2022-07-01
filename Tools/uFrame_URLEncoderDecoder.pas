unit uFrame_URLEncoderDecoder;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Memo.Types,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrame_URLEncoderDecoder = class(TFrame)
    layBottom: TLayout;
    layInput: TLayout;
    memTitleInput: TLabel;
    memInput: TMemo;
    layOutput: TLayout;
    memTitleOutput: TLabel;
    memOutput: TMemo;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layConversion: TRectangle;
    layConversionTitleDescription: TLayout;
    lblConversionTitle: TLabel;
    lblConversionDescription: TLabel;
    SwitchConversion: TSwitch;
    lblSwitchConversion: TLabel;
    imgConversion: TImage;
    procedure FrameResize(Sender: TObject);
    procedure SwitchConversionSwitch(Sender: TObject);
    procedure memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_URLEncoderDecoder.FrameResize(Sender: TObject);
begin
  layInput.Height := (layBottom.Height - layBottom.Padding.Top - layBottom.Padding.Bottom) / 2;
end;

procedure TFrame_URLEncoderDecoder.memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  try
    var URLToEncode := memInput.Text;
    if (SwitchConversion.IsChecked) then
      memOutput.Text := 'My Encoded URL'
    else
      memOutput.Text := 'My Decoded URL';
  except on E: Exception do

  end;
end;

procedure TFrame_URLEncoderDecoder.SwitchConversionSwitch(Sender: TObject);
begin
  if (lblSwitchConversion.Text = 'Encode') then
  begin
    lblSwitchConversion.Text := 'Decode';
    SwitchConversion.IsChecked := False;
  end else
  begin
    lblSwitchConversion.Text := 'Encode';
    SwitchConversion.IsChecked := True;
  end;

  var TempText := memOutput.Text;
  memOutput.Text := memInput.Text;
  memInput.Text := TempText;
end;

end.