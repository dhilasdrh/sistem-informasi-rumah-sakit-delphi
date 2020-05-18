unit DaftarPasien;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, jpeg, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    Image1: TImage;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button1: TButton;
    Image2: TImage;
    Button2: TButton;
    ADOQuery3: TADOQuery;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses pasien, RawatJalan, datamedis;

{$R *.dfm}

procedure TForm2.DBGrid1DblClick(Sender: TObject);
begin
  if Form4.Showing then
  begin
    Form4.edit1.Text:=ADOQuery3.FieldByName('no_rm').AsString;
    Form4.edit2.Text:=ADOQuery3.FieldByName('nama_pasien').AsString;
    Form4.edit6.text:=ADOQuery3.FieldByName('jenis_kelamin').AsString;
    Form4.edit3.Text:=ADOQuery3.FieldByName('umur').AsString;
    Form4.Edit5.Text:=ADOQuery3.FieldByName('gol_darah').AsString;
    Form4.Memo1.Text:=ADOQuery3.FieldByName('alamat').AsString;
    Form4.edit4.Text:=ADOQuery3.FieldByName('jenis_pasien').AsString;
    Form2.Close;
  end
  else if Form9.Showing then
  begin
    Form9.edit1.Text:=ADOQuery3.FieldByName('no_rm').AsString;
    Form9.Edit2.Text:=ADOQuery3.FieldByName('nama_pasien').AsString;
    Form9.Edit3.Text:=ADOQuery3.FieldByName('jenis_kelamin').AsString;
    Form9.Edit4.Text:=ADOQuery3.FieldByName('umur').AsString;
    Form9.Edit5.Text:=ADOQuery3.FieldByName('gol_darah').AsString;
    Form9.Memo1.Text:=ADOQuery3.FieldByName('alamat').AsString;
    Form9.Edit6.Text:=ADOQuery3.FieldByName('jenis_pasien').AsString;
    Form2.Close;
  end
  else if Form6.Showing then
  begin
    Form6.edit1.Text:=ADOQuery3.FieldByName('no_rm').AsString;
    Form6.Edit2.Text:=ADOQuery3.FieldByName('nama_pasien').AsString;
    Form6.Edit3.Text:=ADOQuery3.FieldByName('jenis_kelamin').AsString;
    Form6.Edit4.Text:=ADOQuery3.FieldByName('umur').AsString;
    Form6.Edit5.Text:=ADOQuery3.FieldByName('gol_darah').AsString;
    Form2.Close;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
  with ADOQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from datapasien where no_rm like "'+edit1.text+'%" or nama_pasien like "'+edit1.text+'%"');
    Open;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  with ADOQuery3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from datapasien where no_rm like "'+edit1.text+'%" or nama_pasien like "'+edit1.text+'%"');
    Open;
  end;
end;

end.
