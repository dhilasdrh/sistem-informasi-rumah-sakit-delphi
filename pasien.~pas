unit pasien;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, jpeg, ExtCtrls, DB, ADODB, DateUtils,
  Menus, frxClass, frxDBSet;

type
  TForm4 = class(TForm)
    Image2: TImage;
    Button2: TButton;
    home: TImage;
    Image1: TImage;
    Panel1: TPanel;
    Save2: TButton;
    Save: TButton;
    DBGrid3: TDBGrid;
    Edit17: TEdit;
    Button9: TButton;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label44: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    Registrasi1: TMenuItem;
    DataDokter: TMenuItem;
    RawatJalan1: TMenuItem;
    RawatInap1: TMenuItem;
    RekamMedis: TMenuItem;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    Add: TButton;
    Edit: TButton;
    Delete: TButton;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    ComboBox2: TComboBox;
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit9Click(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure Home1Click(Sender: TObject);
    procedure Registrasi1Click(Sender: TObject);
    procedure DataDokterClick(Sender: TObject);
    procedure RawatJalan1Click(Sender: TObject);
    procedure RekamMedisClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit17Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses DaftarPasien, DaftarDokter, login, registrasi, dokter, RawatJalan,
  datamedis;

{$R *.dfm}


procedure TForm4.Edit1Click(Sender: TObject);
begin
    Form2.Show;
end;

procedure TForm4.Edit2Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  edit12.Text:='RI-00'+IntToStr(ADOQuery1.recordcount+1);
  DateTimePicker1.Date:=DateOf(now);

   edit1.Clear;
   Edit2.Clear;
   Edit3.Clear;
   Edit4.Clear;
   Edit5.Clear;
   Memo1.Clear;
   Edit6.Clear;
   Edit8.Clear;
   Edit9.Clear;
   Edit10.Clear;
   Memo2.Clear;
   Edit11.Clear;
   Combobox1.Text:='';

  Save2.Visible:=false;
  Save.Enabled:=true;
  Add.Enabled:=false;
  Edit.Enabled:=false;
  Delete.Enabled:=false;
end;

procedure TForm4.Edit9Click(Sender: TObject);
begin
  Form7.Show;
end;

procedure TForm4.AddClick(Sender: TObject);
begin
   edit12.Text:='RI-00'+IntToStr(ADOQuery1.recordcount+1);
   edit1.Clear;
   Edit2.Clear;
   Edit3.Clear;
   Edit4.Clear;
   Edit5.Clear;
   Memo1.Clear;
   Edit6.Clear;
   Edit8.Clear;
   Edit9.Clear;
   Edit10.Clear;
   Memo2.Clear;
   Edit11.Clear;
   Combobox1.Text:='';

   save.enabled:=true;
   save2.Visible:=false;
   add.enabled:=false;
   edit.enabled:=false;
   delete.enabled:=false;
end;

procedure TForm4.SaveClick(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Open;
    Append;
    FieldByName('no_registrasi').AsString:=Edit12.Text;
    FieldByName('tgl_registrasi').AsString:=DateToStr(DateTimePicker1.Date);
    FieldByName('no_rm').AsString:=Edit1.Text;
    FieldByName('nama_pasien').AsString:=Edit2.Text;
    FieldByName('jenis_kelamin').AsString:=Edit3.Text;
    FieldByName('umur').AsString:=Edit4.Text;
    FieldByName('gol_darah').AsString:=Edit5.Text;
    FieldByName('alamat').AsString:=Memo1.Text;
    FieldByName('jenis_pasien').AsString:=Edit6.Text;
    FieldByName('poli').AsString:=ComboBox1.Text;
    FieldByName('id_dokter').AsString:=Edit9.Text;
    FieldByName('nama_dokter').AsString:=Edit10.Text;
    FieldByName('kd_kamar').AsString:=ComboBox2.Text;
    FieldByName('nama_kamar').AsString:=Edit8.Text;
    FieldByName('keluhan').AsString:=Memo2.Text;
    FieldByName('diagnosa').AsString:=Edit11.Text;
    Post;
  end;
  MessageDlg('Data telah disimpan',mtInformation,[mbOK],0);

  Save.enabled:=false;
  Add.Enabled:=true;
  Edit.Enabled:=true;
  Delete.Enabled:=true;
  Save2.Visible:=false;

  begin
   edit12.Text:='RI-00'+IntToStr(ADOQuery1.recordcount+1);
   edit1.Clear;
   Edit2.Clear;
   Edit3.Clear;
   Edit4.Clear;
   Edit5.Clear;
   Memo1.Clear;
   Edit6.Clear;
   Edit8.Clear;
   Edit9.Clear;
   Edit10.Clear;
   Memo2.Clear;
   Edit11.Clear;
   Combobox1.Text:='';
  end;
end;

procedure TForm4.EditClick(Sender: TObject);
begin
  Save.Visible:=false;
  Save2.Visible:=true;
  Save2.Enabled:=true;
  Add.Enabled:=false;
  Edit.Enabled:=false;
  Delete.Enabled:=false;
end;

procedure TForm4.Save2Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Open;
    Edit;
    FieldByName('no_registrasi').AsString:=Edit12.Text;
    FieldByName('tgl_registrasi').AsString:=DateToStr(DateTimePicker1.Date);
    FieldByName('no_rm').AsString:=Edit1.Text;
    FieldByName('nama_pasien').AsString:=Edit2.Text;
    FieldByName('jenis_kelamin').AsString:=Edit3.Text;
    FieldByName('umur').AsString:=Edit4.Text;
    FieldByName('gol_darah').AsString:=Edit5.Text;
    FieldByName('alamat').AsString:=Memo1.Text;
    FieldByName('jenis_pasien').AsString:=Edit6.Text;
    FieldByName('poli').AsString:=ComboBox1.Text;
    FieldByName('id_dokter').AsString:=Edit9.Text;
    FieldByName('nama_dokter').AsString:=Edit10.Text;
    FieldByName('kd_kamar').AsString:=ComboBox2.Text;
    FieldByName('nama_kamar').AsString:=Edit10.Text;
    FieldByName('keluhan').AsString:=Memo2.Text;
    FieldByName('diagnosa').AsString:=Edit11.Text;
    Post;
  end;
  MessageDlg('Data telah diedit',mtInformation,[mbOK],0);
  Save.Visible:=false;
  Save2.Visible:=true;

  Save2.Enabled:=false;
  Add.Enabled:=true;
  Edit.Enabled:=true;
  Delete.Enabled:=true;
end;

procedure TForm4.DeleteClick(Sender: TObject);
begin
   ADOQuery1.Open;
   ADOQuery1.Delete;
   MessageDlg('Data telah dihapus',mtInformation,[mbOK],0);

   edit1.Clear;
   Edit2.Clear;
   Edit3.Clear;
   Edit4.Clear;
   Edit5.Clear;
   Memo1.Clear;
   Edit6.Clear;
   Edit8.Clear;
   ComboBox2.Text:='';
   Edit10.Clear;
   Memo2.Clear;
   Edit11.Clear;
   Combobox1.Text:='';
end;

procedure TForm4.DBGrid3CellClick(Column: TColumn);
begin
  Edit12.Text:=ADOQuery1.FieldByName('no_registrasi').AsString;
  DateTimePicker1.Date:=ADOQuery1.FieldByName('tgl_registrasi').AsDateTime;
  Edit1.Text:= ADOQuery1.FieldByName('no_rm').AsString;
  Edit2.Text:= ADOQuery1.FieldByName('nama_pasien').AsString;
  Edit3.Text:= ADOQuery1.FieldByName('jenis_kelamin').AsString;
  Edit4.Text:= ADOQuery1.FieldByName('umur').AsString;
  Edit5.Text:= ADOQuery1.FieldByName('gol_darah').AsString;
  Memo1.Text:= ADOQuery1.FieldByName('alamat').AsString;
  Edit6.Text:= ADOQuery1.FieldByName('jenis_pasien').AsString;
  ComboBox1.Text:= ADOQuery1.FieldByName('poli').AsString;
  Edit9.Text:= ADOQuery1.FieldByName('id_dokter').AsString;
  Edit10.Text:= ADOQuery1.FieldByName('nama_dokter').AsString;
  ComboBox2.Text:= ADOQuery1.FieldByName('kd_kamar').AsString;
  Edit10.Text:= ADOQuery1.FieldByName('nama_kamar').AsString;
  Memo2.Text:= ADOQuery1.FieldByName('keluhan').AsString;
  Edit11.Text:= ADOQuery1.FieldByName('diagnosa').AsString;

  Save2.Visible:=false;
  Save.Enabled:=false;
  Add.Enabled:=true;
  Edit.Enabled:=true;
  Delete.Enabled:=true;
end;

procedure TForm4.Home1Click(Sender: TObject);
begin
  Form1.Show;
  Form4.Close;
end;

procedure TForm4.Registrasi1Click(Sender: TObject);
begin
  Form3.Show;
  Form4.Close;
end;

procedure TForm4.DataDokterClick(Sender: TObject);
begin
  Form5.Show;
  Form4.Close;
end;

procedure TForm4.RawatJalan1Click(Sender: TObject);
begin
  Form9.Show;
  Form4.Close;
end;

procedure TForm4.RekamMedisClick(Sender: TObject);
begin
  Form6.Show;
  Form4.Close;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Form4.Close;
end;

procedure TForm4.Edit17Change(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from rawatinap where no_registrasi like "'+edit17.text+'%" or no_rm like "'+edit17.text+'%" or nama_pasien like "'+edit17.text+'%"');
    Open;
  end;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
    frxreport1.ShowReport();
end;

end.

