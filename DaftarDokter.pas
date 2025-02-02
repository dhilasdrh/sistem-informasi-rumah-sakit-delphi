unit DaftarDokter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm7 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Edit7: TEdit;
    Search: TButton;
    Image2: TImage;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure DBGrid2DblClick(Sender: TObject);
    procedure SearchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses RawatJalan, pasien, datamedis;

{$R *.dfm}

procedure TForm7.DBGrid2DblClick(Sender: TObject);
begin
  if Form9.Showing then
  begin
    Form9.Edit8.Text:= ADOQuery1.FieldByName('id_dokter').AsString;  
    Form9.Edit9.Text:= ADOQuery1.FieldByName('nama_dokter').AsString;
    Form7.Close;
  end
  else if Form4.Showing then
  begin
    Form4.Edit9.Text:= ADOQuery1.FieldByName('id_dokter').AsString;
    Form4.Edit10.Text:= ADOQuery1.FieldByName('nama_dokter').AsString;
    Form7.Close;
  end
  else if Form6.Showing then
  begin
    Form6.Edit6.Text:= ADOQuery1.FieldByName('id_dokter').AsString;
    Form6.Edit7.Text:= ADOQuery1.FieldByName('nama_dokter').AsString;
    Form7.Close;
  end;
end;

procedure TForm7.SearchClick(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from datadokter where id_dokter like "'+edit7.text+'%" or nama_dokter like "%'+edit7.text+'%"');
  ADOQuery1.Open;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
  Form7.Close;
end;

procedure TForm7.Edit7Change(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from datadokter where id_dokter like "'+edit7.text+'%" or nama_dokter like "%'+edit7.text+'%"');
  ADOQuery1.Open;
end;

end.
