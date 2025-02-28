unit U_calculadora;

interface


uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, U_calculos;



type
  Tfrm_calculadora = class(TForm)
    btn_0: TButton;
    btn_1: TButton;
    btn_2: TButton;
    btn_3: TButton;
    btn_4: TButton;
    btn_5: TButton;
    btn_6: TButton;
    btn_7: TButton;
    btn_8: TButton;
    btn_9: TButton;
    btn_ponto: TButton;
    btn_igual: TButton;
    btn_multi: TButton;
    btn_adi: TButton;
    btn_sub: TButton;
    btn_div: TButton;
    box_buttons: TLayout;
    box_top: TLayout;
    lb_operador: TLabel;
    lb_num1: TLabel;
    lb_num2: TLabel;
    btn_backspace: TButton;
    btn_ce: TButton;
    procedure btn_subClick(Sender: TObject);
    procedure btn_adiClick(Sender: TObject);
    procedure btn_multiClick(Sender: TObject);
    procedure btn_divClick(Sender: TObject);
    procedure btn_igualClick(Sender: TObject);
    procedure AtivarDesativarBotoes(operador: string; botaoDesativado: TButton);
    procedure limpaCampos;
    procedure AtivarBotoes;
    procedure InserirNumeros(numero:string);
    function SelecionarLabelDestino: TLabel;
    procedure AdicionaVirgulaNaLabel(labelDestino: TLabel);
    procedure btn_0Click(Sender: TObject);
    procedure btn_1Click(Sender: TObject);
    procedure btn_2Click(Sender: TObject);
    procedure btn_3Click(Sender: TObject);
    procedure btn_4Click(Sender: TObject);
    procedure btn_5Click(Sender: TObject);
    procedure btn_6Click(Sender: TObject);
    procedure btn_7Click(Sender: TObject);
    procedure btn_8Click(Sender: TObject);
    procedure btn_9Click(Sender: TObject);
    procedure btn_pontoClick(Sender: TObject);
    procedure btn_backspaceClick(Sender: TObject);
    procedure btn_ceClick(Sender: TObject);

  private
    var labelDestino: TLabel;
  public

  end;

var
  frm_calculadora: Tfrm_calculadora;

implementation
{$R *.fmx}


  procedure Tfrm_calculadora.btn_0Click(Sender: TObject);
  begin
      InserirNumeros('0');
  end;

  procedure Tfrm_calculadora.btn_1Click(Sender: TObject);
  begin
     InserirNumeros('1');
  end;

  procedure Tfrm_calculadora.btn_2Click(Sender: TObject);
  begin
     InserirNumeros('2');
  end;

  procedure Tfrm_calculadora.btn_3Click(Sender: TObject);
  begin
     InserirNumeros('3');
  end;

  procedure Tfrm_calculadora.btn_4Click(Sender: TObject);
  begin
    InserirNumeros('4');
  end;

  procedure Tfrm_calculadora.btn_5Click(Sender: TObject);
  begin
    InserirNumeros('5');
  end;

  procedure Tfrm_calculadora.btn_6Click(Sender: TObject);
  begin
    InserirNumeros('6');
  end;

  procedure Tfrm_calculadora.btn_7Click(Sender: TObject);
  begin
    InserirNumeros('7');
  end;

  procedure Tfrm_calculadora.btn_8Click(Sender: TObject);
  begin
    InserirNumeros('8');
  end;

  procedure Tfrm_calculadora.btn_9Click(Sender: TObject);
  begin
    InserirNumeros('9');
  end;

  procedure Tfrm_calculadora.btn_adiClick(Sender: TObject);
  begin
    AtivarDesativarBotoes(btn_adi.Text, btn_adi);
  end;

  procedure Tfrm_calculadora.btn_backspaceClick(Sender: TObject);
  begin
    labelDestino:= SelecionarLabelDestino;

    labelDestino.Text:= Copy(labelDestino.Text, 0, Length(labelDestino.Text) - 1);

    if Length(labelDestino.Text) = 0  then
    begin
      labelDestino.Text:= '0';
    end;
  end;

  procedure Tfrm_calculadora.btn_ceClick(Sender: TObject);
  begin
    limpaCampos;
  end;

  procedure Tfrm_calculadora.btn_divClick(Sender: TObject);
  begin
    AtivarDesativarBotoes(btn_div.Text, btn_div);
  end;

  procedure Tfrm_calculadora.btn_multiClick(Sender: TObject);
  begin
    AtivarDesativarBotoes(btn_multi.Text, btn_multi);
  end;

  procedure Tfrm_calculadora.btn_subClick(Sender: TObject);
  begin
    AtivarDesativarBotoes(btn_sub.Text, btn_sub);
  end;

  procedure Tfrm_calculadora.btn_pontoClick(Sender: TObject);
  begin
    labelDestino:= SelecionarLabelDestino;

    AdicionaVirgulaNaLabel(labelDestino);
  end;

  {L�gica dos Bot�es}

  procedure Tfrm_calculadora.AdicionaVirgulaNaLabel(labelDestino: TLabel);
  begin
    if Pos(',', labelDestino.Text) = 0 then
    begin
      labelDestino.Text:= labelDestino.Text + ',';
    end;
  end;

  function Tfrm_calculadora.SelecionarLabelDestino: TLabel;
  begin
    if lb_operador.Text = '.' then
      begin
        Result:= lb_num1;
      end
    else
      begin
       Result:= lb_num2;
      end;
  end;
   procedure Tfrm_calculadora.AtivarBotoes;
  begin
    btn_adi.Enabled:= True;
    btn_sub.Enabled:= True;
    btn_div.Enabled:= True;
    btn_multi.Enabled:= True;
  end;

  procedure Tfrm_calculadora.AtivarDesativarBotoes(operador: string; botaoDesativado: TButton);
  begin
    lb_operador.Text:= operador;
    AtivarBotoes;
    botaoDesativado.Enabled:= False;
  end;

 procedure Tfrm_calculadora.limpaCampos;
  begin
    frm_calculadora.lb_num1.Text:= '0';
    frm_calculadora.lb_num2.Text:= '0';
    frm_calculadora.lb_operador.Text:= '.';
    AtivarBotoes;
  end;

  procedure Tfrm_calculadora.InserirNumeros(numero:string);
  begin
    labelDestino:= SelecionarLabelDestino;

    if labelDestino.Text = '0' then
    begin
       labelDestino.Text:= numero;
    end
    else
    begin
        labelDestino.Text:= labelDestino.Text + numero;
    end;
  end;

  {C�lculo}
  procedure Tfrm_calculadora.btn_igualClick(Sender: TObject);
  var
   numero1, numero2: Double;
   operador: Char;
  begin

    numero1:= StrToFloat(lb_num1.Text);
    numero2:= StrToFloat(lb_num2.Text);
    operador:= lb_operador.Text[1];

    try
    ShowMessage(FloatToStr(CalculoOperacao(numero1, numero2, operador)));

    except
     on E: Exception do
      ShowMessage('Erro: ' + E.Message);
    end;

    limpaCampos;
end;

end.
