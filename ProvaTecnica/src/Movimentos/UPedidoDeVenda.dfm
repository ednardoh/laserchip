object frmMov_PEDVendas: TfrmMov_PEDVendas
  Left = 0
  Top = 0
  Caption = 'Or'#231'amento de Vendas de Palno de Sa'#250'de'
  ClientHeight = 814
  ClientWidth = 1238
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1238
    Height = 814
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pn_Top: TPanel
      Left = 0
      Top = 0
      Width = 1238
      Height = 95
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        1238
        95)
      object Shape1: TShape
        Left = 29
        Top = 9
        Width = 1195
        Height = 72
        Anchors = [akLeft, akTop, akRight, akBottom]
        Brush.Color = 12303225
        Shape = stRoundRect
        ExplicitWidth = 1324
      end
      object lblMessagem: TLabel
        Left = 40
        Top = 9
        Width = 1177
        Height = 69
        Alignment = taCenter
        AutoSize = False
        Caption = 'Or'#231'amento de Venda'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -57
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object pn_Botton: TPanel
      Left = 0
      Top = 739
      Width = 1238
      Height = 75
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitTop = 740
      object Label6: TLabel
        Left = 100
        Top = -267
        Width = 91
        Height = 39
        Alignment = taRightJustify
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 8
        Top = 5
        Width = 276
        Height = 64
        Caption = 'F3-Abrir Or'#231'amento'
        Color = 12303225
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 281
        Top = 5
        Width = 166
        Height = 64
        Caption = 'F4-Produto'
        Color = 12303225
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object Panel8: TPanel
        Left = 444
        Top = 5
        Width = 168
        Height = 64
        Caption = 'F5-Cliente'
        Color = 12303225
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object Panel9: TPanel
        Left = 611
        Top = 5
        Width = 301
        Height = 64
        Caption = 'F6-Selecionar Grade'
        Color = 12303225
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
      object Panel10: TPanel
        Left = 911
        Top = 5
        Width = 177
        Height = 64
        Caption = 'F7-Gravar'
        Color = 12303225
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
      end
    end
    object pn_Grid: TPanel
      Left = 0
      Top = 95
      Width = 1238
      Height = 644
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      ExplicitHeight = 657
      object Panel7: TPanel
        Left = 0
        Top = 237
        Width = 1238
        Height = 63
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          Left = 32
          Top = -3
          Width = 144
          Height = 19
          Caption = 'C'#243'd. Produto [F4]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 743
          Top = -3
          Width = 44
          Height = 19
          Caption = 'Qtde.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 837
          Top = -3
          Width = 114
          Height = 19
          Alignment = taRightJustify
          Caption = 'Valor Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 984
          Top = -1
          Width = 91
          Height = 19
          Alignment = taRightJustify
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 221
          Top = -2
          Width = 173
          Height = 19
          Caption = 'Descri'#231#227'o do Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BTN_Inserir: TSpeedButton
          Left = 1087
          Top = 9
          Width = 130
          Height = 41
          Caption = 'Inserir Produto'
          Flat = True
          Glyph.Data = {
            760C0000424D760C00000000000036000000280000001C0000001C0000000100
            200000000000400C000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9F1
            E7FFC9E4CAFFC7E1C6FF91CA98FF8BC28BFF8BC18DFF8EC894FFC4DFC5FFCBE4
            CCFFE3EEE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF2F6F0FF71B373FF91CA98FF85CB9DFF9FDAB5FFCDF6E6FFEEFF
            FFFFEDFFFFFFD0F8EBFFA2DDB8FF83CB9BFF93CB9DFF6BB26CFFE3ECE0FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9EC99EFF55B065FFA8F6D4FFA2F9
            D3FFBEFFE8FFC8FFECFFCFFFEDFFD1FEEDFFD1FEEDFFCEFFECFFC5FFEBFFBCFE
            E6FFA0F8D3FFA3F5D1FF5BB76CFF8FC08EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DB4
            71FF50C67AFF7CF5BFFF7AEDB8FF94F3C7FFA8F8D5FFB0F4D8FFB3F0D7FFB9F0
            DAFFB8F0DBFFB4EFD6FFAFF4D7FFA7F7D4FF92F2C7FF78EDB5FF74F3BAFF53CC
            81FF64AF6BFFF0F5EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF75B173FF45C978FF4BDF90FF5BE19BFF77EAB2FF88F0
            BFFF98F6CCFFB7E3CFFFD0D2D1FFCCD3D0FFCCD4D0FFD0D1D1FFB6E3CFFF97F6
            CBFF86EFBEFF73EAB1FF5AE19AFF48DA8BFF43CB7AFF61AC64FFF2F6F1FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6BB572FF22B251FF20C2
            5EFF3BCF78FF4FDC8FFF63E5A3FF73EAB0FF7FF0BBFFB4E4CEFFE4DBE0FFDEDC
            DDFFDEDCDDFFE5DCDFFFB5E3CEFF7DEFBAFF71E9AEFF61E4A0FF4ED98CFF39CE
            77FF1FC05CFF21B351FF5BAB62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFB3D7B2FF099327FF10AD43FF20BA57FF2FC76BFF41D37FFF53DD94FF61E4
            A1FF6AE8ABFFABE3C8FFE9E1E6FFE1E1E1FFE1E1E1FFE9E1E6FFAAE3C8FF68E8
            AAFF60E49FFF52DB91FF3FD17DFF2EC569FF1FB955FF0DAA40FF069628FF99C9
            9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1A8D27FF0B9C34FF0AA137FF15B1
            49FF21BC59FF30C76DFF41D37FFF4DDB8DFF50DF96FFA1E1BFFFEFE7EBFFE6E6
            E6FFE6E6E6FFEFE7EBFFA0E1BFFF4FE095FF4CDA8BFF3FD27DFF2EC66BFF20BA
            58FF14AE47FF0BA036FF08972EFF138B23FFF6FAF4FFFFFFFFFFFFFFFFFF8AC1
            88FF07841FFF008D21FF0A9A30FF0FA53BFF14AF47FF20BB58FF2CC568FF38CD
            75FF36D27AFF96DDB6FFF7ECF2FFEBEBEBFFEBEBEBFFF7ECF2FF96DDB5FF35D1
            79FF36CC73FF2CC566FF1EB956FF13AE46FF0EA43AFF09992FFF028C22FF0181
            1AFF6BB36EFFFFFFFFFFFFFFFFFF489E4DFF007409FF02871EFF059127FF0B9D
            33FF0EA53CFF13AF46FF1EB954FF27C160FF22C562FF8CD8ACFFFCF1F8FFEFEF
            EFFFEFEFEFFFFCF1F8FF8DD8ABFF20C461FF25C05FFF1DB853FF13AE45FF0EA5
            3AFF0A9C32FF059026FF01851DFF007409FF389541FFF7FDF6FFD9EDD9FF0675
            0DFF0D7B1EFF0B821EFF007E15FF008718FF008F20FF009829FF00A031FF04A7
            3AFF00A936FF77CD96FFFFF7FFFFF3F3F3FFF3F3F3FFFFF7FFFF78CE96FF00A8
            35FF04A638FF009F30FF009828FF008F1FFF008616FF007D13FF0B801DFF117D
            20FF006700FFCDE6CFFFC9E0C8FF117718FF5BA468FF52A35FFF89BA90FF94BC
            99FF91BF99FF91C19CFF91C49FFF90C6A1FF8AC49BFFC0DDCAFFFEFAFDFFF8F8
            F8FFF8F8F8FFFEFAFDFFC1DDCAFF8AC39CFF90C69FFF91C39EFF91C19BFF91BE
            9AFF93BC98FF86B88EFF52A35FFF5CA568FF1D7A26FFB7D6B8FFACD5B0FF2A83
            33FF599F63FF499A56FFDCEADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFCFFFFFAFAFAFFFAFAFAFFFAFAFAFFFAFAFAFFFFFCFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCEADFFF499A57FF589E
            61FF398943FF83C28BFF8EC896FF3C8944FF5E9F65FF50995AFFD5E5D7FFFFFF
            FFFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
            FDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFD
            FDFFFFFFFFFFD5E6D7FF519A5BFF5E9D65FF4B8E52FF77B87AFF8FC997FF4089
            47FF649F6AFF589A5FFFD7E6D9FFFFFFFFFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
            FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
            FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFFFFFFFFD8E7DAFF5A9A60FF639F
            69FF518F56FF76B97CFFB1D7B5FF38853DFF6CA070FF649E6BFFE0EAE0FFFFFF
            FFFFFFFDFFFFFFFDFFFFFFFDFEFFFEFDFEFFFEFBFEFFFCFBFBFFF9F9F9FFF9F9
            F9FFF9F9F9FFF9F9F9FFFCFBFBFFFEFBFEFFFEFDFEFFFFFCFEFFFFFDFFFFFFFD
            FFFFFFFFFFFFE1EBE1FF679F6CFF6AA16FFF4B8C50FF88C590FFCBE3CDFF3082
            35FF72A176FF78A87CFFB0CCB3FFBBD3BCFFBDD5C0FFBFD8C2FFC3DAC6FFC5DC
            C9FFC4DCC7FFDBE6DDFFF9F8F9FFF6F6F6FFF6F6F6FFF9F8F9FFDCE7DDFFC4DC
            C7FFC6DCC9FFC3DAC5FFBFD8C3FFBCD6BFFFBBD3BEFFAFCCB2FF7AAA7EFF73A3
            76FF39843DFFBCDCBFFFD3EBD5FF4A934FFF76A179FF87B08AFF93BB98FF97BD
            9BFF9DC29FFFA2C6A6FFA8CBABFFACCDB0FFACCEB0FFCCDCCEFFF6F5F6FFF2F2
            F2FFF2F2F2FFF6F5F6FFCDDDCFFFABCEB0FFACCDB0FFA9CBADFFA2C6A6FF9DC2
            A0FF98BE9BFF94BB97FF8AB38CFF7AA47BFF398A40FFCAE6CDFFFFFFFFFF5DA7
            62FF749F75FF8FB392FFA7C4A9FFACC9ADFFB1CDB3FFB6D0B8FFBCD4BDFFC0D7
            C1FFC0D9C2FFD4DFD6FFF1EFF0FFEEEEEEFFEEEEEEFFF1EFF0FFD4DFD6FFC1D9
            C3FFC0D7C1FFBDD4BFFFB6D0B8FFB2CCB3FFACC8AFFFA7C5A9FF93B595FF76A1
            79FF60A263FFF3FBF3FFFFFFFFFF83C386FF6F9D71FF95B496FFB0C9B0FFB4CC
            B5FFB9D0BBFFBED4C0FFC4D8C6FFC8DCC9FFCADCCBFFD7E1D8FFECEBECFFEAEA
            EAFFEAEAEAFFECEAECFFD7E0D8FFC9DECBFFC8DBCAFFC5D8C6FFBFD5C1FFBAD1
            BBFFB4CDB7FFB1CAB2FF95B596FF78A079FF6BB672FFFFFFFFFFFFFFFFFFFFFF
            FFFF2C8D30FF9EB5A0FFB5CBB6FFBED1BFFFC3D6C3FFC8DAC9FFCEDECFFFD2E1
            D3FFD5E3D5FFDAE0DAFFE6E5E6FFE4E4E4FFE4E4E4FFE6E5E6FFDAE1DAFFD5E4
            D6FFD1E0D3FFCEDECFFFC9DACAFFC3D6C4FFBED2BEFFB6CDB7FFA5B8A3FF348D
            3BFFFAFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFB8DEBBFF4C904EFFBDCBBCFFC7D7
            C8FFCADACBFFD0DED1FFD5E2D5FFD9E5DAFFDDE9DDFFDDE2DDFFE0DFE0FFE0E0
            E0FFE0E0E0FFE0DFE0FFDDE2DDFFDDE9DFFFDAE5DAFFD6E3D7FFD1DED1FFCBDB
            CBFFC7D8C8FFC1CFC0FF559558FF9DD0A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF6FB775FF79A77AFFDBE1DAFFD2DED2FFD5E2D5FFDCE6DDFFDFE9
            E0FFE5ECE5FFDCE1DCFFD8D8D8FFD9D9D9FFD9D9D9FFD8D8D8FFDCE1DDFFE4EC
            E4FFE1EAE1FFDCE6DDFFD6E2D6FFD1DFD1FFD9E1D9FF89AD89FF63AF68FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DB165FF8AB5
            8EFFE8EAE7FFDDE7DDFFE2E9E1FFE6ECE6FFEBF1EBFFE7EAE7FFE3E3E3FFE4E5
            E4FFE4E5E4FFE3E3E3FFE7EAE7FFEBF2EBFFE6ECE7FFE1EAE2FFDDE7DDFFE9EA
            E8FF9BBC9DFF64AA66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF6EB674FF72AB75FFF7F2F7FFEDF1EDFFEAEF
            EAFFEEF2EEFFF3F7F3FFF8FBF8FFF8FCF8FFF8FCF8FFF8FBF8FFF3F8F3FFEEF2
            EEFFEAF0EAFFEBF1EBFFFAF4F9FF7EB080FF67B16EFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFB0D9B3FF3A963FFFD0E0D1FFEEF2EEFFFFFCFFFFFFFEFFFFFFFEFFFFFFFD
            FFFFFFFDFEFFFFFDFFFFFFFEFFFFFEFCFEFFF0F3F0FFDCE6DCFF45984BFF9CCF
            9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF75B978FF77B7
            7BFF9ACA9EFF9CCA9FFFBDDDC0FFDDEDDFFFDEEDE0FFC1E0C4FF9FCCA2FF95CA
            9AFF82BC86FF6FB473FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FDFAFFC6E2C8FFCEE4D0FFB4DAB8FF95CC
            9DFF94CC9CFFB0D8B4FFCDE4CFFFC4E1C7FFF4F9F4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = BTN_InserirClick
        end
        object edt_CodigoProd: TEdit
          Left = 29
          Top = 23
          Width = 186
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HideSelection = False
          ParentFont = False
          TabOrder = 0
          OnEnter = EDT_CodClienteEnter
          OnExit = edt_CodigoProdExit
          OnKeyDown = edt_CodigoProdKeyDown
          OnKeyPress = edt_CodigoProdKeyPress
        end
        object Edt_Qtde: TEdit
          Left = 742
          Top = 23
          Width = 89
          Height = 27
          TabStop = False
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Text = '1,00'
          OnChange = Edt_QtdeChange
          OnEnter = EDT_CodClienteEnter
          OnExit = Edt_QtdeExit
          OnKeyPress = Edt_QtdeKeyPress
        end
        object Edt_PrecProd: TEdit
          Left = 834
          Top = 23
          Width = 119
          Height = 27
          TabStop = False
          Alignment = taRightJustify
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Text = '0,00'
          OnKeyDown = Edt_PrecProdKeyDown
          OnKeyPress = Edt_PrecProdKeyPress
        end
        object EDT_ValorTotal: TEdit
          Left = 959
          Top = 23
          Width = 120
          Height = 27
          TabStop = False
          Alignment = taRightJustify
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '0,00'
          OnKeyPress = Edt_PrecProdKeyPress
        end
        object EDT_DescrProduto: TEdit
          Left = 219
          Top = 23
          Width = 521
          Height = 27
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
      end
      object pn_left: TPanel
        Left = 0
        Top = 300
        Width = 29
        Height = 301
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        ExplicitHeight = 314
      end
      object GRD_Produtos: TDBGrid
        Left = 29
        Top = 300
        Width = 1058
        Height = 301
        Align = alClient
        DataSource = ds_PedVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnKeyDown = GRD_ProdutosKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'CodProduto'
            Title.Caption = 'C'#243'd. Produto'
            Width = 171
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescrProduto'
            Title.Caption = 'Descri'#231#227'o do Produto'
            Width = 525
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Unitario'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Total'
            Title.Caption = 'Valor Total'
            Width = 125
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 1087
        Top = 300
        Width = 151
        Height = 301
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
        ExplicitHeight = 314
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1238
        Height = 237
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
        object Label13: TLabel
          Left = 34
          Top = 0
          Width = 136
          Height = 19
          Caption = 'Num. Or'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 233
          Top = 0
          Width = 95
          Height = 19
          Caption = 'Dt. Emiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 32
          Top = 114
          Width = 96
          Height = 19
          Caption = 'Cliente [F5]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 160
          Top = 113
          Width = 135
          Height = 19
          Caption = 'Nome do Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 33
          Top = 58
          Width = 112
          Height = 19
          Caption = 'Corretor[F10]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 161
          Top = 57
          Width = 146
          Height = 19
          Caption = 'Nome do Corretor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 33
          Top = 170
          Width = 134
          Height = 19
          Caption = 'Operadora [F11]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 173
          Top = 170
          Width = 163
          Height = 19
          Caption = 'Nome da Operadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 431
          Top = 0
          Width = 141
          Height = 19
          Caption = 'dias de validade?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BTN_Imprimir: TSpeedButton
          Left = 888
          Top = 6
          Width = 190
          Height = 42
          Caption = 'Imprimir &Or'#231'amento'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Glyph.Data = {
            360C0000424D360C000000000000360000002800000020000000200000000100
            180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFEF2F2F2EAEAEAE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
            E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
            E9E9E9E9E9EEEEEEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF9F9F9C8C8C8B7B7B7B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
            B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
            B6B6B6B6B6C0C0C0F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFDFDFDD4D4D4D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
            D0D0D0D0D5D5D5DCDCDCC8C8C8CCCCCCD2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
            D2D2D2D2D2D0D0D0F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCE9E9E9
            DFDFDFDFDFDFDFDFDFC9C9C9E6E6E6E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
            E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
            E9E9E9E9E9C8C8C8DEDEDEDFDFDFDFDFDFDFDFDFECECECFDFDFDDDDDDDB5B5B5
            AFAFAFAFAFAFAFAFAFAFAFAFBEBEBED6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
            D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
            D6D6CDCDCDA1A1A1AFAFAFAFAFAFAFAFAFAFAFAFB5B5B5E5E5E5D8D8D8CACACA
            C9C9C9C9C9C9C9C9C9CECECE8E8E8ED8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8
            D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8D8
            D8D89C9C9CB1B1B1C9C9C9C9C9C9C9C9C9C9C9C9CBCBCBDCDCDCD5D5D5D0D0D0
            D0D0D0D0D0D0D0D0D0D3D3D32121215757575F5F5F5E5E5E5E5E5E5D5D5D5D5D
            5D5C5C5C5C5C5C5C5C5C5B5B5B5B5B5B5A5A5A5A5A5A5A5A5A59595959595959
            5959111111959595D0D0D0D2D2D2D0D0D0D2D2D2D0D0D0DDDDDDD6D6D6D6D6D6
            D6D6D6D6D6D6D6D6D6D7D7D71818180202020202020101010101010101010101
            0101010101010100000000000000000000000000000000000000000000000000
            0000000000ACACACD6D6D6DCDCDCDDDDDDD9D9D9D6D6D6DDDDDDD6D6D6DDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDAEAEAE6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
            6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6F
            6F6F8E8E8EDDDDDDDDDDDDDFDFDFE0E0E0DEDEDEDDDDDDDCDCDCD7D7D7E3E3E3
            E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
            E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
            E3E3E3E3E3E3E3E3E3E3E3DADADAD7D7D7DFDFDFE3E3E3DCDCDCD7D7D7E9E9E9
            E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
            E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
            E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9DBDBDBD7D7D7F0F0F0
            F1F1F1F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F4E6D6EED5B6EBD3B5EBD5B9EBD7
            BDEBD7BEEBD7BEEBD6BCEBD4B8EBD1B3EBCEAEEBC8A8EBC2A2ECBE9FF1CEBAEF
            EBE9F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F0F0F0F0F0F0DBDBDBD8D8D8F7F7F7
            FCFCFCFDFDFDFDFDFDFDFDFDFDFDFDFCEFE5DA9B65C07B3CC08043C0844AC086
            4EC08851C08750C0864DC08348C07F41C0783AC06F32C06629C05D20CC662FF3
            CBB6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCFCFCF6F6F6DBDBDBD8D8D8FDFDFD
            FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBE8DAD58B54CE894FCE8F55CE945ACE96
            5ECE9860CE975FCE965DCE9359CE8D53CE864CCE7E45CE753DCE6C35CD632CEE
            B99FFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFDFDDADADADADADAFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E3D4E9A474E7A875E3A772E3AC77E3AF
            7AE3B17BE3B17BEAB987E5AD79E3A671E39F6BE39864E3905DE78D5DE9885AED
            B69BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCDCDCDCFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8DDCED68959C48150C1814FC4844DC985
            49C9864BC9864ACF8E56C98146C97C41C9763CC97036C9682FCB642CD66F3EEA
            B095FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E1E1E1E9E9E9F4F4F4
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D7C8E19C77CB9D81CB9F83D3A382E0A8
            7FE0A97FE0A87EE0A67CDFA479DFA076DF9C71DF986EE39871E99E7BEB9B78E8
            AD91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9F4F4F4FCFCFCE1E1E1
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D0C1ECB299EAB39CEAB49EECBAA3ECBD
            A2EABA9EE9B89AE8B698E8B496E9B396EAB296ECB297ECAF94ECAE93ECAD92E6
            B197FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE2E2E2FEFEFEFFFFFFF8F8F8
            E8E8E8E9E9E9EEEEEEFDFDFDFFFFFFF1C8B6F1C2ADF5CBB8F5CBB8F3CAB6F3CA
            B5F3C9B4F3C8B3F2C7B2F2C5B0F2C3AEF2C1ABF2C0AAF1BFA9F1BEA8F1BEA7E3
            AF96FFFFFFEEEEEEE6E6E6DFDFDFE8E8E8E9E9E9FCFCFCFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFF8F8F8CDCDCDDBDBDBD8B3A2E8AE94F4CCBBF7D6C7FADDD0FCE3
            D8FCE2D6FCE1D5FCE0D4FCE0D3FCDFD2FCE0D4F9D9CBF6D1C0F3C7B3EBB298D3
            A087E5E5E5CCCCCCEBEBEBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFED7D7D7E9E9E9C2C2C2F9F7F6F2E0D8EDCFC2EAC4B3E9C3
            B1E9C8B9E8C9BBE6C7BAE4C5B8E2C2B4DDB7A6DCBCADDBC0B4DBC9C0DBD7D5D5
            D5D5E9E9E9D4D4D4F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFED8D8D8FBFBFBCDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FEFBFBFBF7F7F7F4F4F4F1F1F1EEEEEEEBEBEBE8E8E8E5E5E5E2E2E2E0E0E0D6
            D6D6E9E9E9D4D4D4F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFED9D9D9FFFFFFD3D3D3FFFFFFFFFFFFFFFFFFFFFFFFFEFE
            FEFDFDFDF9F9F9F6F6F6F3F3F3F0F0F0EDEDEDEAEAEAE7E7E7E4E4E4E1E1E1D6
            D6D6E8E8E8D4D4D4F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFED9D9D9FFFFFFD7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFEFEFEFBFBFBF8F8F8F5F5F5F1F1F1EEEEEEEBEBEBE8E8E8E5E5E5E3E3E3D7
            D7D7E8E8E8D4D4D4F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFED7D7D7FDFDFDDBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFDFDFDFAFAFAF7F7F7F3F3F3F0F0F0EDEDEDEAEAEAE7E7E7E4E4E4D8
            D8D8E8E8E8D4D4D4F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFED1D1D1FCFCFCDEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFEFEFEFCFCFCF9F9F9F5F5F5F2F2F2EFEFEFECECECE9E9E9E6E6E6D8
            D8D8E7E7E7D3D3D3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFEFEFED5D5D5FBFBFBE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFEFEFEFAFAFAF7F7F7F4F4F4F1F1F1EEEEEEEBEBEBE8E8E8D9
            D9D9E7E7E7D3D3D3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF3F3F3DEDEDECFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFEFEFEFDFDFDF9F9F9F6F6F6F3F3F3EFEFEFEDEDEDEAEAEADA
            DADAE7E7E7D3D3D3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEFBFBFBF8F8F8F5F5F5F1F1F1EEEEEEEBEBEBDB
            DBDBE7E7E7D3D3D3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF8F8F8DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFAFAFAF7F7F7F4F4F4F1F1F1EEEEEEDC
            DCDCE7E7E7D2D2D2F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEBEBEBF1F1F1F1F1F1F1F1F1F1F1F1F1F1
            F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1E2
            E2E2EAEAEADDDDDDFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
            FBFBF3F3F3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          Spacing = 20
          OnClick = BTN_ImprimirClick
        end
        object EDT_Numpedido: TEdit
          Left = 33
          Top = 25
          Width = 192
          Height = 27
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          HideSelection = False
          ParentFont = False
          TabOrder = 1
          Text = '000000'
          OnKeyPress = edt_CodigoProdKeyPress
        end
        object EDT_DTEMISSAO: TDateTimePicker
          Left = 233
          Top = 25
          Width = 191
          Height = 27
          Date = 44262.000000000000000000
          Time = 0.562654907407704700
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnEnter = EDT_DTEMISSAOEnter
          OnExit = EDT_DTEMISSAOExit
          OnKeyDown = EDT_DTEMISSAOKeyDown
        end
        object EDT_CodCliente: TEdit
          Left = 31
          Top = 139
          Width = 124
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnEnter = EDT_CodClienteEnter
          OnExit = EDT_CodClienteExit
          OnKeyDown = EDT_CodClienteKeyDown
          OnKeyPress = EDT_CodClienteKeyPress
        end
        object EDT_NomeCliente: TEdit
          Left = 160
          Top = 139
          Width = 918
          Height = 27
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object EDT_CodCorretor: TEdit
          Left = 32
          Top = 83
          Width = 124
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnEnter = EDT_CodClienteEnter
          OnExit = EDT_CodCorretorExit
          OnKeyDown = EDT_CodCorretorKeyDown
          OnKeyPress = EDT_CodCorretorKeyPress
        end
        object EDT_NomeCorretor: TEdit
          Left = 161
          Top = 83
          Width = 917
          Height = 27
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object EDT_CodOperadora: TEdit
          Left = 32
          Top = 195
          Width = 124
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnEnter = EDT_CodClienteEnter
          OnExit = EDT_CodOperadoraExit
          OnKeyDown = EDT_CodOperadoraKeyDown
          OnKeyPress = EDT_CodOperadoraKeyPress
        end
        object EDT_NomeOperadora: TEdit
          Left = 161
          Top = 195
          Width = 918
          Height = 27
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clSilver
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object ckb_Aplicadesconto: TCheckBox
          Left = 589
          Top = 28
          Width = 145
          Height = 17
          Caption = 'Aplicar desconto'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 8
        end
        object SPE_diasValidade: TSpinEdit
          Left = 431
          Top = 24
          Width = 141
          Height = 29
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 9
          Value = 10
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 601
        Width = 1238
        Height = 43
        Align = alBottom
        TabOrder = 5
        ExplicitTop = 614
        object Label7: TLabel
          Left = 863
          Top = 16
          Width = 59
          Height = 19
          Caption = 'Total  :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtTotVenda: TEdit
          Left = 927
          Top = 10
          Width = 161
          Height = 27
          TabStop = False
          Alignment = taRightJustify
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
        end
      end
    end
  end
  object ds_PedVenda: TDataSource
    DataSet = QryPedproduto
    Left = 96
    Top = 720
  end
  object QryPedproduto: TClientDataSet
    PersistDataPacket.Data = {
      980000009619E0BD01000000180000000500000000000300000098000A436F64
      50726F6475746F0100490000000100055749445448020002000D000C44657363
      7250726F6475746F0100490000000100055749445448020002003C000A517561
      6E74696461646508000400000000000E56616C6F725F556E69746172696F0800
      0400000000000B56616C6F725F546F74616C08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    AfterPost = QryPedprodutoAfterPost
    AfterDelete = QryPedprodutoAfterDelete
    Left = 160
    Top = 719
    object QryPedprodutoCodProduto: TStringField
      FieldName = 'CodProduto'
      Size = 13
    end
    object QryPedprodutoDescrProduto: TStringField
      FieldName = 'DescrProduto'
      Size = 60
    end
    object QryPedprodutoQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object QryPedprodutoValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object QryPedprodutoValor_Total: TFloatField
      FieldName = 'Valor_Total'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object ds_Pedido: TDataSource
    Left = 40
    Top = 719
  end
  object frxDBDatasetOrc: TfrxDBDataset
    UserName = 'frxRelatOrcamento'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'ID_Corretor=ID_Corretor'
      'NomeCorretor=NomeCorretor'
      'CpfCnpj=CpfCnpj'
      'NomeCliente=NomeCliente'
      'Cnpj=Cnpj'
      'RazaoSocOperadora=RazaoSocOperadora'
      'NumOrcamento=NumOrcamento'
      'DataEmissao=DataEmissao'
      'DataValidade=DataValidade'
      'ID_Produto=ID_Produto'
      'DescricaoProd=DescricaoProd'
      'ID_Categoria=ID_Categoria'
      'DescrCategoria=DescrCategoria'
      'Quantidade=Quantidade'
      'PrecoProduto=PrecoProduto'
      'Desconto=Desconto'
      'ValorTotal=ValorTotal')
    DataSet = QryOrcamento
    BCDToCurrency = False
    Left = 1112
    Top = 471
  end
  object QryOrcamento: TFDQuery
    Connection = frmDatamodulo.DBConect
    SQL.Strings = (
      
        'select M.id, M.ID_Corretor, Co.Nome as NomeCorretor, Cl.CpfCnpj,' +
        ' Cl.Nome as NomeCliente,'
      
        '       Op.Cnpj, Op.RazaoSocial as RazaoSocOperadora, M.NumOrcame' +
        'nto, '
      #9'   CONVERT(VARCHAR(10), M.DataEmissao,103) as DataEmissao, '
      #9'   CONVERT(VARCHAR(10), M.DataValidade,103) as DataValidade,'
      
        #9'   MI.ID_Produto, Pr.DescricaoProd, Pr.ID_Categoria, Ct.Descric' +
        'ao as DescrCategoria, MI.Quantidade,'
      #9'   MI.PrecoProduto, MI.Desconto, MI.ValorTotal'
      'from TB_MovtoVenda M'
      '     Inner Join TB_Corretor Co on Co.ID = M.ID_Corretor'
      #9' Inner Join TB_Clientes Cl on Cl.ID = M.ID_Cliente'
      #9' Inner Join TB_Operadoras Op on Op.ID = M.ID_Operadora'
      #9' Inner Join TB_MovtoItens MI on MI.ID_MovtoVenda = M.ID'
      #9' Inner Join TB_ProdutoPLS Pr on Pr.ID = MI.ID_Produto'
      #9' Inner Join TB_CategoriaPLS Ct on Ct.ID = Pr.ID_Categoria'
      'Where M.id =:ID')
    Left = 1112
    Top = 231
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object QryOrcamentoid: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryOrcamentoID_Corretor: TLargeintField
      FieldName = 'ID_Corretor'
      Origin = 'ID_Corretor'
      Required = True
    end
    object QryOrcamentoNomeCorretor: TStringField
      FieldName = 'NomeCorretor'
      Origin = 'NomeCorretor'
      Size = 60
    end
    object QryOrcamentoCpfCnpj: TStringField
      FieldName = 'CpfCnpj'
      Origin = 'CpfCnpj'
    end
    object QryOrcamentoNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Origin = 'NomeCliente'
      Size = 100
    end
    object QryOrcamentoCnpj: TStringField
      FieldName = 'Cnpj'
      Origin = 'Cnpj'
    end
    object QryOrcamentoRazaoSocOperadora: TStringField
      FieldName = 'RazaoSocOperadora'
      Origin = 'RazaoSocOperadora'
      Size = 100
    end
    object QryOrcamentoNumOrcamento: TLargeintField
      FieldName = 'NumOrcamento'
      Origin = 'NumOrcamento'
    end
    object QryOrcamentoDataEmissao: TStringField
      FieldName = 'DataEmissao'
      Origin = 'DataEmissao'
      ReadOnly = True
      Size = 10
    end
    object QryOrcamentoDataValidade: TStringField
      FieldName = 'DataValidade'
      Origin = 'DataValidade'
      ReadOnly = True
      Size = 10
    end
    object QryOrcamentoID_Produto: TLargeintField
      FieldName = 'ID_Produto'
      Origin = 'ID_Produto'
      Required = True
    end
    object QryOrcamentoDescricaoProd: TStringField
      FieldName = 'DescricaoProd'
      Origin = 'DescricaoProd'
      Size = 100
    end
    object QryOrcamentoID_Categoria: TLargeintField
      FieldName = 'ID_Categoria'
      Origin = 'ID_Categoria'
      Required = True
    end
    object QryOrcamentoDescrCategoria: TStringField
      FieldName = 'DescrCategoria'
      Origin = 'DescrCategoria'
      Size = 60
    end
    object QryOrcamentoQuantidade: TFMTBCDField
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
      DisplayFormat = '.0.00'
      Precision = 18
      Size = 2
    end
    object QryOrcamentoPrecoProduto: TFMTBCDField
      FieldName = 'PrecoProduto'
      Origin = 'PrecoProduto'
      DisplayFormat = '.0.00'
      Precision = 18
      Size = 2
    end
    object QryOrcamentoDesconto: TFMTBCDField
      FieldName = 'Desconto'
      Origin = 'Desconto'
      DisplayFormat = '.0.00'
      Precision = 18
      Size = 2
    end
    object QryOrcamentoValorTotal: TFMTBCDField
      FieldName = 'ValorTotal'
      Origin = 'ValorTotal'
      DisplayFormat = '.0.00'
      Precision = 18
      Size = 2
    end
  end
  object ds_Orcamento: TDataSource
    DataSet = QryOrcamento
    Left = 1112
    Top = 287
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 1119
    Top = 523
  end
  object frxReportOrc: TfrxReport
    Version = '6.6.17'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44526.056189479200000000
    ReportOptions.LastChange = 44526.085478483800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 1111
    Top = 411
    Datasets = <
      item
        DataSet = frxDBDatasetOrc
        DataSetName = 'frxRelatOrcamento'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 68.031540000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 2.338590000000000000
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 60.472480000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 19.559060000000000000
          Width = 710.551640000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Or'#231'amento')
          ParentFont = False
        end
        object Date: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 492.338900000000000000
          Top = 8.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Time: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 579.268090000000000000
          Top = 6.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Page: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 651.079160000000000000
          Top = 8.559060000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 170.637910000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        Condition = 'frxRelatOrcamento."ID_Corretor"'
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 0.779530000000000000
          Top = 2.559060000000000000
          Width = 718.110700000000000000
          Height = 120.944960000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 13.677180000000000000
          Top = 9.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Corretor :')
          ParentFont = False
        end
        object frxRelatOrcamentoNomeCorretor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 86.267780000000000000
          Top = 9.000000000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'NomeCorretor'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxRelatOrcamento."NomeCorretor"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 17.456710000000000000
          Top = 36.236240000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente :')
          ParentFont = False
        end
        object frxRelatOrcamentoNomeCliente: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 85.488250000000000000
          Top = 36.015770000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'NomeCliente'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxRelatOrcamento."NomeCliente"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 6.118120000000000000
          Top = 62.692950000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Operadora :')
          ParentFont = False
        end
        object frxRelatOrcamentoRazaoSocOperadora: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 85.488250000000000000
          Top = 62.913420000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'RazaoSocOperadora'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxRelatOrcamento."RazaoSocOperadora"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 6.000000000000000000
          Top = 96.708720000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data Emiss'#227'o :')
          ParentFont = False
        end
        object frxRelatOrcamentoDataEmissao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 102.826840000000000000
          Top = 96.488250000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'DataEmissao'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxRelatOrcamento."DataEmissao"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 96.708720000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data Validade :')
          ParentFont = False
        end
        object frxRelatOrcamentoDataValidade: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 96.708720000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'DataValidade'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxRelatOrcamento."DataValidade"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 533.897960000000000000
          Top = 9.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186' Or'#231'amento :')
          ParentFont = False
        end
        object frxRelatOrcamentoNumOrcamento: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 633.165740000000000000
          Top = 9.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'NumOrcamento'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxRelatOrcamento."NumOrcamento"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 143.181200000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cod.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 143.181200000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o do produto')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 481.220780000000000000
          Top = 143.740260000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Qtde.')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 540.252320000000000000
          Top = 143.181200000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Prc. Prod.')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 608.283860000000000000
          Top = 143.181200000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Desc.')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 657.638220000000000000
          Top = 143.181200000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vlr. Total')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 0.559060000000000000
          Top = 133.283550000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetOrc
        DataSetName = 'frxRelatOrcamento'
        RowCount = 0
        object frxRelatOrcamentoID_Produto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 1.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'ID_Produto'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxRelatOrcamento."ID_Produto"]')
          ParentFont = False
        end
        object frxRelatOrcamentoDescricaoProd: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 51.692950000000000000
          Top = 2.000000000000000000
          Width = 419.527830000000000000
          Height = 18.897650000000000000
          DataField = 'DescricaoProd'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxRelatOrcamento."DescricaoProd"]')
          ParentFont = False
        end
        object frxRelatOrcamentoQuantidade: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 1.220470000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'Quantidade'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxRelatOrcamento."Quantidade"]')
          ParentFont = False
        end
        object frxRelatOrcamentoPrecoProduto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 535.693260000000000000
          Top = 1.220470000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'PrecoProduto'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxRelatOrcamento."PrecoProduto"]')
          ParentFont = False
        end
        object frxRelatOrcamentoDesconto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 602.724800000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'Desconto'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxRelatOrcamento."Desconto"]')
          ParentFont = False
        end
        object frxRelatOrcamentoValorTotal: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 653.858690000000000000
          Top = 0.220470000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'ValorTotal'
          DataSet = frxDBDatasetOrc
          DataSetName = 'frxRelatOrcamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxRelatOrcamento."ValorTotal"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 0.559060000000000000
          Top = 23.456710000000000000
          Width = 714.331170000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Total Geral :')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxRelatOrcamento."ValorTotal">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
end
