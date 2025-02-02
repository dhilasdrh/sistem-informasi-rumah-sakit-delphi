unit RawatJalan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, ADODB, DB,
  DBCtrls, Mask, DateUtils, Menus, frxClass, frxDBSet;

type
  TForm9 = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    Registrasi1: TMenuItem;
    DataDokter: TMenuItem;
    RawatJalan1: TMenuItem;
    RawatInap1: TMenuItem;
    RekamMedis: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    DBGrid3: TDBGrid;
    Save2: TButton;
    Save: TButton;
    Button1: TButton;
    Edit11: TEdit;
    Search: TButton;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    DateTimePicker2: TDateTimePicker;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label24: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Edit: TButton;
    Delete: TButton;
    Add: TButton;
    Button2: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    ADOQuery1: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit8Click(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure SearchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Home1Click(Sender: TObject);
    procedure Registrasi1Click(Sender: TObject);
    procedure DataDokterClick(Sender: TObject);
    procedure RawatInap1Click(Sender: TObject);
    procedure RekamMedisClick(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses DaftarPasien, DaftarDokter, login, registrasi, dokter, pasien,
  datamedis;

{$R *.dfm}

procedure TForm9.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
  Memo2.Clear;
  edit7.Text:='RJ-00'+IntToStr(ADOQuery1.recordcount+1);
  DateTimePicker2.Date:=DateOf(today);

  Save2.Visible:=false;
  Save.Enabled:=true;
  Add.Enabled:=false;
  Edit.Enabled:=false;
  Delete.Enabled:=false;
end;

procedure TForm9.Edit1Click(Sender: TObject);
begin
    Form2.Show;
end;

procedure TForm9.Edit8Click(Sender: TObject);
begin
  Form7.Show;
end;

procedure TForm9.AddClick(Sender: TObject);
begin
   edit7.Text:='RJ-00'+IntToStr(ADOQuery1.recordcount+1);
   DateTimePicker2.DateTime:=DateOf(today);
   edit1.Clear;
   Edit2.Clear;
   Edit3.Clear;
   Edit4.Clear;
   Edit5.Clear;
   Memo1.Clear;
   Edit6.Clear;
   Edit8.Clear;
   Edit9.Clear;
   Memo2.Clear;
   //Edit10.Clear;
   Combobox1.text:='';

   Save.Visible:=true;
   Save2.Visible:=false;
   Save.Enabled:=true;
   edit.enabled:=false;  
   delete.Enabled:=false;
   add.enabled:=false;  
end;

procedure TForm9.SaveClick(Sender: TObject);
begin
    with ADOQuery1 do
    begin
    Open;
    Append;
    FieldByName('no_registrasi').AsString:=Edit7.Text;
    FieldByName('tgl_registrasi').AsString:=DateToStr(DateTimePicker2.Date);
    FieldByName('no_rm').AsString:=Edit1.Text;
    FieldByName('nama_pasien').AsString:=Edit2.Text;
    FieldByName('jenis_kelamin').AsString:=Edit3.Text;
    FieldByName('umur').AsString:=Edit4.Text;
    FieldByName('gol_darah').AsString:=Edit5.Text;
    FieldByName('alamat').AsString:=Memo1.Text;
    FieldByName('jenis_pasien').AsString:=Edit6.Text;
    FieldByName('poli').AsString:=ComboBox1.Text;
    FieldByName('id_dokter').AsString:=Edit8.Text;
    FieldByName('nama_dokter').AsString:=Edit9.Text;
    FieldByName('keluhan').AsString:=Memo2.Text;
    //FieldByName('diagnosa').AsString:=Edit10.Text;
    Post;
    end;

    MessageDlg('Data berhasil disimpan',mtInformation,[mbOK],0);

  Save.enabled:=false;
  Add.Enabled:=true;
  Edit.Enabled:=true;
  Delete.Enabled:=true;
  Save2.Visible:=false;
end;

procedure TForm9.EditClick(Sender: TObject);
begin
  Save.Visible:=false;
  Save2.Visible:=true;

  Save2.Enabled:=true;
  Add.Enabled:=false;
  Edit.Enabled:=false;
  Delete.Enabled:=false;
end;

procedure TForm9.Save2Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Open;
    Edit;
    FieldByName('no_registrasi').AsString:=Edit7.Text;
    FieldByName('tgl_registrasi').AsString:=DateToStr(DateTimePicker2.Date);
    FieldByName('no_rm').AsString:=Edit1.Text;
    FieldByName('nama_pasien').AsString:=Edit2.Text;
    FieldByName('jenis_kelamin').AsString:=Edit3.Text;
    FieldByName('umur').AsString:=Edit4.Text;
    FieldByName('gol_darah').AsString:=Edit5.Text;
    FieldByName('alamat').AsString:=Memo1.Text;
    FieldByName('poli').AsString:=ComboBox1.Text;
    FieldByName('id_dokter').AsString:=Edit8.Text;
    FieldByName('nama_dokter').AsString:=Edit9.Text;
    FieldByName('keluhan').AsString:=Memo2.Text;
    //FieldByName('diagnosa').AsString:=Edit10.Text;
    Post;
   end;
  MessageDlg('Data berhasil diedit',mtInformation,[mbOK],0);

  Save.Visible:=true;
  Save2.Visible:=false;
  Save.Enabled:=false;
  Add.Enabled:=true;
  Edit.Enabled:=true;
  Delete.Enabled:=true;
end;

procedure TForm9.DeleteClick(Sender: TObject);
begin
   ADOQuery1.Open;
   ADOQuery1.Delete;
   MessageDlg('Data berhasil dihapus',mtInformation,[mbOK],0);

   edit7.Text:='RJ-00'+IntToStr(ADOQuery1.recordcount+1);
   edit1.Clear;
   Edit2.Clear;
   Edit3.Clear;
   Edit4.Clear;
   Edit5.Clear;
   Memo1.Clear;
   Edit6.Clear;
   Edit8.Clear;
   Edit9.Clear;
   Memo2.Clear;
   //Edit10.Clear;
   ComboBox1.Text:='';
end;

procedure TForm9.Button9Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from rawatjalan where no_registrasi like "'+edit11.text+'%" or no_rm like "'+edit11.text+'%" or nama_pasien like "'+edit11.text+'%"');
    Open;
  end;
end;

procedure TForm9.DBGrid3CellClick(Column: TColumn);
begin
    Edit7.Text:=ADOQuery1.FieldByName('no_registrasi').AsString;
    DateTimePicker2.Date:=ADOQuery1.FieldByName('tgl_registrasi').AsDateTime;
    Edit1.Text:= ADOQuery1.FieldByName('no_rm').AsString;
    Edit2.Text:= ADOQuery1.FieldByName('nama_pasien').AsString;
    Edit3.Text:= ADOQuery1.FieldByName('jenis_kelamin').AsString;
    Edit4.Text:= ADOQuery1.FieldByName('umur').AsString;
    Edit5.Text:= ADOQuery1.FieldByName('gol_darah').AsString;
    Memo1.Text:= ADOQuery1.FieldByName('alamat').AsString;
    Edit6.Text:= ADOQuery1.FieldByName('jenis_pasien').AsString;
    ComboBox1.Text:= ADOQuery1.FieldByName('poli').AsString;
    Edit8.Text:= ADOQuery1.FieldByName('id_dokter').AsString;
    Edit9.Text:= ADOQuery1.FieldByName('nama_dokter').AsString;
    Memo2.Text:= ADOQuery1.FieldByName('keluhan').AsString;
    //Edit10.Text:= ADOQuery1.FieldByName('diagnosa').AsString;

    Save.Enabled:=false;
    Add.Enabled:=true;
    Edit.Enabled:=true;
    Delete.Enabled:=true;
end;

procedure TForm9.SearchClick(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from rawatjalan where no_registrasi like "'+edit11.text+'%" or no_rm like "'+edit11.text+'%" or nama_pasien like "'+edit11.text+'%"');
    Open;
  end;
  
  save.enabled:=false;
  save2.enabled:=false;
  add.enabled:=true;
  edit.enabled:=true;
  delete.enabled:=true;
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
  Form9.Close;
end;

procedure TForm9.Home1Click(Sender: TObject);
begin
  Form9.Close;
  Form1.Show;
end;

procedure TForm9.Registrasi1Click(Sender: TObject);
begin
  Form9.Close;
  Form3.Show;
end;

procedure TForm9.DataDokterClick(Sender: TObject);
begin
  Form9.Close;
  Form5.Show;
end;

procedure TForm9.RawatInap1Click(Sender: TObject);
begin
  Form9.Close;
  Form4.Show;
end;

procedure TForm9.RekamMedisClick(Sender: TObject);
begin
  Form9.Close;
  Form6.Show;
end;

procedure TForm9.Edit11Change(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from rawatjalan where no_registrasi like "'+edit11.text+'%" or no_rm like "'+edit11.text+'%" or nama_pasien like "'+edit11.text+'%"');
    Open;
  end;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
    frxReport1.ShowReport();
end;

end.
