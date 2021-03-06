unit Main;

{

  TGLPanel should be a OpenGL crossplatform Panel

  actually it is only a Windows FMX component

}

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Execute.FMX.GLPanels, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TMainForm = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
  private
    { Déclarations privées }
    GLPanel: TGLPanel;
    procedure GLSetup(Sender: TObject);
    procedure GLPaint(Sender: TObject);
  public
    { Déclarations publiques }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses
  Execute.CubeMan;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  GLPanel := TGLPanel.Create(Self);
  GLPanel.OnGLSetup := GLSetup;
  GLPanel.OnGLPaint := GLPaint;
  GLPanel.Parent := Self;
  GLPanel.OnResize :=  Panel2Resize;
  GLPanel.Align := TAlignLayout.Client;

end;

procedure TMainForm.GLSetup(Sender: TObject);
begin
  glSetupCubeMan();
end;

procedure TMainForm.GLPaint(Sender: TObject);
begin
  glDrawCubeMan();
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  GLPanel.Invalidate;
end;

procedure TMainForm.Panel2Resize(Sender: TObject);
begin
  ;
end;

end.
