#Generated Form Function
function GenerateForm {
########################################################################
# Code Generated By: SAPIEN Technologies PrimalForms (Community Edition) v1.0.10.0
# Generated On: 28.08.2020 12:30
# Generated By: michael
########################################################################

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
#endregion

#region Generated Form Objects
$frm_Sequenzer = New-Object System.Windows.Forms.Form

$btn_Original = New-Object System.Windows.Forms.Button
$btn_From = New-Object System.Windows.Forms.Button
$btn_Next = New-Object System.Windows.Forms.Button
$btn_Load = New-Object System.Windows.Forms.Button
$btn_Save = New-Object System.Windows.Forms.Button
$btn_Action = New-Object System.Windows.Forms.Button
$btn_Cancel = New-Object System.Windows.Forms.Button
$btn_First = New-Object System.Windows.Forms.Button
$btn_Last = New-Object System.Windows.Forms.Button
$btn_Target = New-Object System.Windows.Forms.Button

$lbl_Debug = New-Object System.Windows.Forms.Label
$lbl_Preview = New-Object System.Windows.Forms.Label
$tbx_Preview = New-Object System.Windows.Forms.TextBox
$grp_Mode = New-Object System.Windows.Forms.GroupBox
$rbm_Append = New-Object System.Windows.Forms.RadioButton
$tbx_Change = New-Object System.Windows.Forms.TextBox
$rbm_Prepend = New-Object System.Windows.Forms.RadioButton
$rbm_Replace = New-Object System.Windows.Forms.RadioButton
$tbx_Target = New-Object System.Windows.Forms.TextBox
$lbl_Target = New-Object System.Windows.Forms.Label
$lbl_Original = New-Object System.Windows.Forms.Label
$tbx_Original = New-Object System.Windows.Forms.TextBox
$grp_MARK = New-Object System.Windows.Forms.GroupBox
$rbf_Prepend = New-Object System.Windows.Forms.RadioButton
$rbf_Append = New-Object System.Windows.Forms.RadioButton
$rbf_Replace = New-Object System.Windows.Forms.RadioButton
$rbf_None = New-Object System.Windows.Forms.RadioButton
$tbx_Search = New-Object System.Windows.Forms.TextBox
$lbl_MarkSearch = New-Object System.Windows.Forms.Label
$grp_Value = New-Object System.Windows.Forms.GroupBox
$cbx_Zero = New-Object System.Windows.Forms.CheckBox
$tbx_ToField = New-Object System.Windows.Forms.TextBox
$lbl_ToField = New-Object System.Windows.Forms.Label
$tbx_Fromfield = New-Object System.Windows.Forms.TextBox
$lbl_FromField = New-Object System.Windows.Forms.Label
$tbx_From = New-Object System.Windows.Forms.TextBox
$lbl_From = New-Object System.Windows.Forms.Label
$tbx_Delimiter = New-Object System.Windows.Forms.TextBox
$lbl_Numbers = New-Object System.Windows.Forms.Label
$nud_Count = New-Object System.Windows.Forms.NumericUpDown
$nud_Step = New-Object System.Windows.Forms.NumericUpDown
$nud_To = New-Object System.Windows.Forms.NumericUpDown
$nud_From = New-Object System.Windows.Forms.NumericUpDown
$rbv_List = New-Object System.Windows.Forms.RadioButton
$rbv_Text = New-Object System.Windows.Forms.RadioButton
$rbv_Numbers = New-Object System.Windows.Forms.RadioButton

$ofd_Original = New-Object System.Windows.Forms.OpenFileDialog
$opd_Target = New-Object System.Windows.Forms.FolderBrowserDialog
$ofd_From = New-Object System.Windows.Forms.OpenFileDialog
$sfd_Save = New-Object System.Windows.Forms.SaveFileDialog
$ofd_Load = New-Object System.Windows.Forms.OpenFileDialog

$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
#endregion Generated Form Objects

###############################################################################

#region Varlist KEL
$Version = 0.2      # 0.2 KEL 24.8.2020 New ergonomic Design
					#                   Setup of all Dialogs
					# 0.1 KEL 11.6.2020 Design, Structure

$debug 	= $true      # On/Off Debug Info
$changed = $false   # Flagged if any changes are made
#endregion

#region Functions KEL
function save {

}
function Load {


}

function preview {

}

function action {

}

#Debug function for testing: Maybe set On or OFF by $debug
function Debug{
	Param(
		[Parameter(Mandatory=$false)]  [String]$Message   = "Hit Debugpoint!" # default]
	)
	if ($debug) {
       $lbl_Debug = $Message.ToUpper()
	}
}
#endregion

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
#Provide Custom Code for events specified in PrimalForms.
$btn_Original_OnClick= 
{
	#Opens file open Dialog to select Original filename
	$ofd_Original.AddExtension = $False #Extension wird nicht automatisch angefügt falls sie fehlt
	$ofd_Original.InitialDirectory = $tbx_Original.Text #"$env:userprofile\Documents"
	$ofd_Original.ShowHelp = $True
	$ofd_Original.Title = "Open Original File to rename ..."

	#Original file to rename shall be selected
	$ok = $ofd_Original.ShowDialog()
	if ($ok -eq "OK") {
		#Falls ein File selektiert wurde, in der Textbox anzeigen
		$tbx_Original.Text = $ofd_Original.FileName #Falls Multiselect aktiviert, .Filenames benutzen und als Array speichern
		$changed = $True	# Mark Change for Save query
	} else {
		# Cancel wurde gedrückt ...
		if ($tbx_Original.Text -and (test-path $tbx_Original.Text)) {
			# Keep $tbx_Original.Text
			$tbx_Preview.Text = "Original File is validated!"
		} else{
			$tbx_Preview.Text = "WARNING: No valid file selected!"
			$tbx_Original.Text = ""
		}	
	}
}

$btn_Target_OnClick= 
{

	#Initialisierung des OpenFolderDialogs ...
	$opd_Target.SelectedPath = $tbx_Target.Text #"$env:userprofile\Documents"
	$opd_Target.InitialDirectory = $tbx_Target.Text #"$env:userprofile\Documents"

	#Target path shall be selected
	$ok = $opd_Target.ShowDialog()
	if ($ok -eq "OK") {
		#Falls ein Ordner selektiert wurde, in der Textbox anzeigen
		$tbx_Target.Text = $opd_Target.SelectedPath #Returns selected path ...
		$changed = $True	# Mark Change for Save query
	} else {
		# Cancel wurde gedrückt ...
		if ($tbx_Preview.Text -and (test-path $tbx_Preview.Text)) {
			# Keep $tbx_Target.Text
			$tbx_Preview.Text = "Path is validated!"
		} else{
			$tbx_Target.Text = ""
			$tbx_Preview.Text = "No valid path selected"
		}	
	}
}

$btn_From_OnClick= 
{

	#???.
	$ofd_From.AddExtension = $false # Extension wird automatisch angefügt falls sie fehlt

	$ofd_From.Filter = "Textdateien (*.txt)|*.txt"
	
	$ofd_From.Filter = "EXCEL-Dateien (*.xls*)|*.xls*"

	$ofd_From.InitialDirectory = (Get-ChildItem $tbx_Original.Text).directory.toString()
	                            # split-path $tbx_Original.Text
	                            # "$env:userprofile\Documents"
	$ofd_From.ShowHelp = $True
	$ofd_From.Title = "From ..."

	#Textdatei soll geöffnet werden
	$ok = $ofd_From.ShowDialog()
	if ($ok -eq "OK") {
		#If a file is selected show in textbox
		$Load_Filename = $ofd_From.FileName #if Multiselect is acrive, use .Filenames and save as array

		#??? Load all Entries
		$tbx_Preview.Text = "Now it would be loaded: " + $Load_Filename
		$changed = $false	# Mark "Loaded""

	} else {
		# Cancel was hit  ...
		$tbx_Preview.Text = "Nothing loaded ..."
	}

}

$btn_Save_OnClick= 
{
	$changed = $True	# Mark Change for Save query
	#???.
	$sfd_Save.AddExtension = $true #Extension wird  automatisch angefügt falls sie fehlt
	$sfd_Save.defaultExt = "seq"
	$sfd_Save.FileName = "default.seq"
	$sfd_Save.Filter = "Sequenzerdateien (*.seq)|*.seq"
	$sfd_Save.InitialDirectory = "$env:userprofile\Documents"
	$sfd_Save.ShowHelp = $True
	$sfd_Save.Title = "Save configuration ..."

	#Textdatei sol geöffnet werden
	$ok = $sfd_Save.ShowDialog()
	if ($ok -eq "OK") {
		#Falls ein File selektiert wurde, in der Textbox anzeigen
		$Save_Filename = $sfd_Save.FileName #Falls Multiselect aktiviert, .Filenames benutzen und als Array speichern

		#??? Save all Entries
		$tbx_Preview.Text = "Now it would be saved: " + $Save_Filename

	} else {
		# Cancel wurde gedrückt ...
		$tbx_Preview.Text = "Nothing saved ..."
	}
}

$btn_Load_OnClick= 
{
	$changed = $True	# Mark Change for Save query
	#???.
	$ofd_Load.AddExtension = $true #Extension wird automatisch angefügt falls sie fehlt
	$ofd_Load.defaultExt = "seq"
	$ofd_Load.FileName = "default.seq"
	$ofd_Load.Filter = "Textdateien (*.seq)|*.seq"
	$ofd_Load.InitialDirectory = "$env:userprofile\Documents"
	$ofd_Load.ShowHelp = $True
	$ofd_Load.Title = "Load configuration ..."

	#Textdatei soll geöffnet werden
	$ok = $ofd_Load.ShowDialog()
	if ($ok -eq "OK") {
		#Falls ein File selektiert wurde, in der Textbox anzeigen
		$Load_Filename = $ofd_Load.FileName #Falls Multiselect aktiviert, .Filenames benutzen und als Array speichern

		#??? Load all Entries
		$tbx_Preview.Text = "Now it would be loaded: " + $Load_Filename

	} else {
		# Cancel wurde gedrückt ...
		$tbx_Preview.Text = "Nothing loaded ..."
	}
}


$btn_Action_OnClick= 
{

	$tbx_Preview.Text = "Action ..." 
}

$btn_Cancel_OnClick= 
{
	#??? Quit, Save, Cancel?
	if ($changed -eq $True) {
		# ??? Save
	}	
	$frm_Sequenzer.close()
}


#------ Preview -------

$Preview_Click= 
{
#TODO: Place custom script here
	$tbx_Preview.Text = "Preview ..." 
}

$btn_First_OnClick= 
{
#TODO: Place custom script here
	$tbx_Preview.Text = "First ..." 
}


$btn_Next_OnClick= 
{
#TODO: Place custom script here
	$tbx_Preview.Text = "Next ..." 
}

$btn_Last_OnClick= 
{
#TODO: Place custom script here
$tbx_Preview.Text = "Last ..." 
}

#---------- Change Value
$rbv_List_Checked= 
{
	$changed = $True	# Mark Change for Save query
	$tbx_Preview.Text = "List Checked ..." 
}

$rbv_Numbers_Checked= 
{
	$changed = $True	# Mark Change for Save query
	$tbx_Preview.Text = "Numbers checked ..." 
}

$rbv_Text_Click= 
{
	$changed = $True	# Mark Change for Save query
	$tbx_Preview.Text = "Text Click ..." 
}

$rbv_Numbers_Click= 
{
	$changed = $True	# Mark Change for Save query

}

$cbx_Zero_CheckChanged= 
{
	$changed = $True	# Mark Change for Save query

}
$rbv_Class_Click= 
{
	$changed = $True	# Mark Change for Save query

}


$rbv_Text_CheckChanged= 
{
	$changed = $True	# Mark Change for Save query

}

#--------- Change Numbers ----------
$nud_To_ValChange= 
{
	$changed = $True	# Mark Change for Save query

}

$nud_Count_ValChange= 
{
	$changed = $True	# Mark Change for Save query

}

$nud_From_ValChange= 
{
	$changed = $True	# Mark Change for Save query

}

$nud_Step_ValChange= 
{
	$changed = $True	# Mark Change for Save query

}



#--------- Change Mode ---------
$rbm_Change_CheckedChange= 
{
	$changed = $True	# Mark Change for Save query

}

$rbm_Prepend_CheckedChanged= 
{
	$changed = $True	# Mark Change for Save query

}


$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$frm_Sequenzer.WindowState = $InitialFormWindowState

	#Init Loads
	$tbx_Original.Text = "C:\Users\michael\Desktop\Test\test.txt"
	$tbx_Target.Text = "C:\Users\michael\Desktop\Test\"

}

####################################################################################


#region Generated Form Code
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 413
$System_Drawing_Size.Width = 489
$frm_Sequenzer.ClientSize = $System_Drawing_Size
$frm_Sequenzer.DataBindings.DefaultDataSourceUpdateMode = 0
$frm_Sequenzer.Name = "frm_Sequenzer"
$frm_Sequenzer.Text = "Sequenzer (c) KEL Version V" + $Version


$btn_Next.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 108
$System_Drawing_Point.Y = 366
$btn_Next.Location = $System_Drawing_Point
$btn_Next.Name = "btn_Next"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 70
$btn_Next.Size = $System_Drawing_Size
$btn_Next.TabIndex = 24
$btn_Next.Text = ">"
$btn_Next.UseVisualStyleBackColor = $True
$btn_Next.add_Click($handler_button1_Click)

$frm_Sequenzer.Controls.Add($btn_Next)


$btn_Load.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 386
$System_Drawing_Point.Y = 300
$btn_Load.Location = $System_Drawing_Point
$btn_Load.Name = "btn_Load"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$btn_Load.Size = $System_Drawing_Size
$btn_Load.TabIndex = 22
$btn_Load.Text = "Load Config"
$btn_Load.UseVisualStyleBackColor = $True
$btn_Load.add_Click($btn_Load_OnClick)

$frm_Sequenzer.Controls.Add($btn_Load)


$btn_Save.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 304
$System_Drawing_Point.Y = 300
$btn_Save.Location = $System_Drawing_Point
$btn_Save.Name = "btn_Save"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$btn_Save.Size = $System_Drawing_Size
$btn_Save.TabIndex = 21
$btn_Save.Text = "Save Config"
$btn_Save.UseVisualStyleBackColor = $True
$btn_Save.add_Click($btn_Save_OnClick)

$frm_Sequenzer.Controls.Add($btn_Save)


$btn_Action.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 304
$System_Drawing_Point.Y = 378
$btn_Action.Location = $System_Drawing_Point
$btn_Action.Name = "btn_Action"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$btn_Action.Size = $System_Drawing_Size
$btn_Action.TabIndex = 20
$btn_Action.Text = "Action ..."
$btn_Action.UseVisualStyleBackColor = $True
$btn_Action.add_Click($btn_Action_OnClick)

$frm_Sequenzer.Controls.Add($btn_Action)


$btn_Cancel.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 386
$System_Drawing_Point.Y = 378
$btn_Cancel.Location = $System_Drawing_Point
$btn_Cancel.Name = "btn_Cancel"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$btn_Cancel.Size = $System_Drawing_Size
$btn_Cancel.TabIndex = 19
$btn_Cancel.Text = "Cancel"
$btn_Cancel.UseVisualStyleBackColor = $True
$btn_Cancel.add_Click($btn_Cancel_OnClick)

$frm_Sequenzer.Controls.Add($btn_Cancel)

$lbl_Debug.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 78
$System_Drawing_Point.Y = 323
$lbl_Debug.Location = $System_Drawing_Point
$lbl_Debug.Name = "lbl_Debug"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 15
$System_Drawing_Size.Width = 382
$lbl_Debug.Size = $System_Drawing_Size
$lbl_Debug.TabIndex = 18
$lbl_Debug.Text = "DEBUG"

$frm_Sequenzer.Controls.Add($lbl_Debug)


$btn_Last.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 184
$System_Drawing_Point.Y = 366
$btn_Last.Location = $System_Drawing_Point
$btn_Last.Name = "btn_Last"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 75
$btn_Last.Size = $System_Drawing_Size
$btn_Last.TabIndex = 17
$btn_Last.Text = ">I"
$btn_Last.UseVisualStyleBackColor = $True
$btn_Last.add_Click($handler_btn_Last_Click)

$frm_Sequenzer.Controls.Add($btn_Last)

$lbl_Preview.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 28
$System_Drawing_Point.Y = 323
$lbl_Preview.Location = $System_Drawing_Point
$lbl_Preview.Name = "lbl_Preview"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 15
$System_Drawing_Size.Width = 100
$lbl_Preview.Size = $System_Drawing_Size
$lbl_Preview.TabIndex = 16
$lbl_Preview.Text = "Preview:"
$lbl_Preview.add_Click($handler_label7_Click)

$frm_Sequenzer.Controls.Add($lbl_Preview)

$tbx_Preview.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 28
$System_Drawing_Point.Y = 341
$tbx_Preview.Location = $System_Drawing_Point
$tbx_Preview.Name = "tbx_Preview"
$tbx_Preview.ReadOnly = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 433
$tbx_Preview.Size = $System_Drawing_Size
$tbx_Preview.TabIndex = 15
$tbx_Preview.Text = "Please configure ..."
$tbx_Preview.add_Click($Preview_Click)

$frm_Sequenzer.Controls.Add($tbx_Preview)


$btn_First.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 366
$btn_First.Location = $System_Drawing_Point
$btn_First.Name = "btn_First"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 75
$btn_First.Size = $System_Drawing_Size
$btn_First.TabIndex = 14
$btn_First.Text = "I<"
$btn_First.UseVisualStyleBackColor = $True
$btn_First.add_Click($handler_button4_Click)

$frm_Sequenzer.Controls.Add($btn_First)


$grp_Mode.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 28
$System_Drawing_Point.Y = 74
$grp_Mode.Location = $System_Drawing_Point
$grp_Mode.Name = "grp_Mode"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 37
$System_Drawing_Size.Width = 432
$grp_Mode.Size = $System_Drawing_Size
$grp_Mode.TabIndex = 12
$grp_Mode.TabStop = $False
$grp_Mode.Text = "MODE"
$grp_Mode.add_Enter($handler_grp_Mode_Enter)

$frm_Sequenzer.Controls.Add($grp_Mode)

$rbm_Append.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 130
$System_Drawing_Point.Y = 12
$rbm_Append.Location = $System_Drawing_Point
$rbm_Append.Name = "rbm_Append"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 68
$rbm_Append.Size = $System_Drawing_Size
$rbm_Append.TabIndex = 8
$rbm_Append.Text = "Append"
$rbm_Append.UseVisualStyleBackColor = $True

$grp_Mode.Controls.Add($rbm_Append)

$tbx_Change.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 265
$System_Drawing_Point.Y = 12
$tbx_Change.Location = $System_Drawing_Point
$tbx_Change.Name = "tbx_Change"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 140
$tbx_Change.Size = $System_Drawing_Size
$tbx_Change.TabIndex = 10
$tbx_Change.Text = "_"

$grp_Mode.Controls.Add($tbx_Change)


$rbm_Prepend.Checked = $True
$rbm_Prepend.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 56
$System_Drawing_Point.Y = 12
$rbm_Prepend.Location = $System_Drawing_Point
$rbm_Prepend.Name = "rbm_Prepend"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 68
$rbm_Prepend.Size = $System_Drawing_Size
$rbm_Prepend.TabIndex = 7
$rbm_Prepend.TabStop = $True
$rbm_Prepend.Text = "Prepend"
$rbm_Prepend.UseVisualStyleBackColor = $True
$rbm_Prepend.add_CheckedChanged($handler_radioButton1_CheckedChanged)

$grp_Mode.Controls.Add($rbm_Prepend)


$rbm_Replace.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 198
$System_Drawing_Point.Y = 12
$rbm_Replace.Location = $System_Drawing_Point
$rbm_Replace.Name = "rbm_Replace"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 78
$rbm_Replace.Size = $System_Drawing_Size
$rbm_Replace.TabIndex = 9
$rbm_Replace.Text = "Replace"
$rbm_Replace.UseVisualStyleBackColor = $True
$rbm_Replace.add_CheckedChanged($handler_radioButton3_CheckedChanged)

$grp_Mode.Controls.Add($rbm_Replace)


$tbx_Target.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 100
$System_Drawing_Point.Y = 46
$tbx_Target.Location = $System_Drawing_Point
$tbx_Target.Name = "tbx_Target"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 319
$tbx_Target.Size = $System_Drawing_Size
$tbx_Target.TabIndex = 6
$tbx_Target.Text = ".\"

$frm_Sequenzer.Controls.Add($tbx_Target)

$lbl_Target.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 28
$System_Drawing_Point.Y = 49
$lbl_Target.Location = $System_Drawing_Point
$lbl_Target.Name = "lbl_Target"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 66
$lbl_Target.Size = $System_Drawing_Size
$lbl_Target.TabIndex = 5
$lbl_Target.Text = "Target path:"
$lbl_Target.add_Click($handler_label2_Click)

$frm_Sequenzer.Controls.Add($lbl_Target)


$btn_Target.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 425
$System_Drawing_Point.Y = 44
$btn_Target.Location = $System_Drawing_Point
$btn_Target.Name = "btn_Target"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 35
$btn_Target.Size = $System_Drawing_Size
$btn_Target.TabIndex = 3
$btn_Target.Text = "..."
$btn_Target.UseVisualStyleBackColor = $True
$btn_Target.add_Click($btn_Target_OnClick)

$frm_Sequenzer.Controls.Add($btn_Target)

$lbl_Original.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 28
$System_Drawing_Point.Y = 24
$lbl_Original.Location = $System_Drawing_Point
$lbl_Original.Name = "lbl_Original"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 19
$System_Drawing_Size.Width = 67
$lbl_Original.Size = $System_Drawing_Size
$lbl_Original.TabIndex = 2
$lbl_Original.Text = "Original file:"
$lbl_Original.add_Click($handler_label1_Click)

$frm_Sequenzer.Controls.Add($lbl_Original)

$tbx_Original.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 100
$System_Drawing_Point.Y = 22
$tbx_Original.Location = $System_Drawing_Point
$tbx_Original.Name = "tbx_Original"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 319
$tbx_Original.Size = $System_Drawing_Size
$tbx_Original.TabIndex = 1
$tbx_Original.Text = "test.doc"

$frm_Sequenzer.Controls.Add($tbx_Original)


$btn_Original.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 425
$System_Drawing_Point.Y = 20
$btn_Original.Location = $System_Drawing_Point
$btn_Original.Name = "btn_Original"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 35
$btn_Original.Size = $System_Drawing_Size
$btn_Original.TabIndex = 0
$btn_Original.Text = "..."
$btn_Original.UseVisualStyleBackColor = $True
$btn_Original.add_Click($btn_Original_OnClick)

$frm_Sequenzer.Controls.Add($btn_Original)


$grp_MARK.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 28
$System_Drawing_Point.Y = 228
$grp_MARK.Location = $System_Drawing_Point
$grp_MARK.Name = "grp_MARK"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 71
$System_Drawing_Size.Width = 432
$grp_MARK.Size = $System_Drawing_Size
$grp_MARK.TabIndex = 23
$grp_MARK.TabStop = $False
$grp_MARK.Text = "FILE MARK (INLINE CHARS UTF-8)"
$grp_MARK.add_Enter($handler_groupBox1_Enter)

$frm_Sequenzer.Controls.Add($grp_MARK)

$rbf_Prepend.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 202
$System_Drawing_Point.Y = 15
$rbf_Prepend.Location = $System_Drawing_Point
$rbf_Prepend.Name = "rbf_Prepend"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 65
$rbf_Prepend.Size = $System_Drawing_Size
$rbf_Prepend.TabIndex = 5
$rbf_Prepend.TabStop = $True
$rbf_Prepend.Text = "Prepend"
$rbf_Prepend.UseVisualStyleBackColor = $True

$grp_MARK.Controls.Add($rbf_Prepend)


$rbf_Append.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 131
$System_Drawing_Point.Y = 14
$rbf_Append.Location = $System_Drawing_Point
$rbf_Append.Name = "rbf_Append"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 68
$rbf_Append.Size = $System_Drawing_Size
$rbf_Append.TabIndex = 4
$rbf_Append.TabStop = $True
$rbf_Append.Text = "Append"
$rbf_Append.UseVisualStyleBackColor = $True

$grp_MARK.Controls.Add($rbf_Append)


$rbf_Replace.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 60
$System_Drawing_Point.Y = 14
$rbf_Replace.Location = $System_Drawing_Point
$rbf_Replace.Name = "rbf_Replace"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 68
$rbf_Replace.Size = $System_Drawing_Size
$rbf_Replace.TabIndex = 3
$rbf_Replace.Text = "Replace"
$rbf_Replace.UseVisualStyleBackColor = $True

$grp_MARK.Controls.Add($rbf_Replace)


$rbf_None.Checked = $True
$rbf_None.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 5
$System_Drawing_Point.Y = 14
$rbf_None.Location = $System_Drawing_Point
$rbf_None.Name = "rbf_None"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 68
$rbf_None.Size = $System_Drawing_Size
$rbf_None.TabIndex = 2
$rbf_None.TabStop = $True
$rbf_None.Text = "None"
$rbf_None.UseVisualStyleBackColor = $True

$grp_MARK.Controls.Add($rbf_None)

$tbx_Search.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 50
$System_Drawing_Point.Y = 44
$tbx_Search.Location = $System_Drawing_Point
$tbx_Search.Name = "tbx_Search"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 349
$tbx_Search.Size = $System_Drawing_Size
$tbx_Search.TabIndex = 1
$tbx_Search.Text = "_MARK_"

$grp_MARK.Controls.Add($tbx_Search)

$lbl_MarkSearch.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 6
$System_Drawing_Point.Y = 48
$lbl_MarkSearch.Location = $System_Drawing_Point
$lbl_MarkSearch.Name = "lbl_MarkSearch"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 17
$System_Drawing_Size.Width = 41
$lbl_MarkSearch.Size = $System_Drawing_Size
$lbl_MarkSearch.TabIndex = 0
$lbl_MarkSearch.Text = "Search"

$grp_MARK.Controls.Add($lbl_MarkSearch)


$grp_Value.AccessibleRole = 31

$grp_Value.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 112
$grp_Value.Location = $System_Drawing_Point
$grp_Value.Name = "grp_Value"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 110
$System_Drawing_Size.Width = 433
$grp_Value.Size = $System_Drawing_Size
$grp_Value.TabIndex = 13
$grp_Value.TabStop = $False
$grp_Value.Text = "VALUES"

$frm_Sequenzer.Controls.Add($grp_Value)

$cbx_Zero.Checked = $True
$cbx_Zero.CheckState = 1
$cbx_Zero.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 370
$System_Drawing_Point.Y = 30
$cbx_Zero.Location = $System_Drawing_Point
$cbx_Zero.Name = "cbx_Zero"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 16
$cbx_Zero.Size = $System_Drawing_Size
$cbx_Zero.TabIndex = 16
$cbx_Zero.UseVisualStyleBackColor = $True
$cbx_Zero.add_CheckedChanged($handler_checkBox1_CheckedChanged)

$grp_Value.Controls.Add($cbx_Zero)

$tbx_ToField.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 291
$System_Drawing_Point.Y = 84
$tbx_ToField.Location = $System_Drawing_Point
$tbx_ToField.Name = "tbx_ToField"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 27
$tbx_ToField.Size = $System_Drawing_Size
$tbx_ToField.TabIndex = 15
$tbx_ToField.Text = "C23"

$grp_Value.Controls.Add($tbx_ToField)

$lbl_ToField.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 212
$System_Drawing_Point.Y = 87
$lbl_ToField.Location = $System_Drawing_Point
$lbl_ToField.Name = "lbl_ToField"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 85
$lbl_ToField.Size = $System_Drawing_Size
$lbl_ToField.TabIndex = 14
$lbl_ToField.Text = "To Field: [B20]"

$grp_Value.Controls.Add($lbl_ToField)

$tbx_Fromfield.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 178
$System_Drawing_Point.Y = 84
$tbx_Fromfield.Location = $System_Drawing_Point
$tbx_Fromfield.Name = "tbx_Fromfield"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 28
$tbx_Fromfield.Size = $System_Drawing_Size
$tbx_Fromfield.TabIndex = 13
$tbx_Fromfield.Text = "B3"

$grp_Value.Controls.Add($tbx_Fromfield)

$lbl_FromField.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 91
$System_Drawing_Point.Y = 87
$lbl_FromField.Location = $System_Drawing_Point
$lbl_FromField.Name = "lbl_FromField"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 18
$System_Drawing_Size.Width = 91
$lbl_FromField.Size = $System_Drawing_Size
$lbl_FromField.TabIndex = 12
$lbl_FromField.Text = "From Field: [A1]"
$lbl_FromField.add_Click($handler_label5_Click)

$grp_Value.Controls.Add($lbl_FromField)


$btn_From.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 391
$System_Drawing_Point.Y = 56
$btn_From.Location = $System_Drawing_Point
$btn_From.Name = "btn_From"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 35
$btn_From.Size = $System_Drawing_Size
$btn_From.TabIndex = 11
$btn_From.Text = "..."
$btn_From.UseVisualStyleBackColor = $True
$btn_From.add_Click($btn_From_OnClick)

$grp_Value.Controls.Add($btn_From)

$tbx_From.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 131
$System_Drawing_Point.Y = 57
$tbx_From.Location = $System_Drawing_Point
$tbx_From.Name = "tbx_From"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 254
$tbx_From.Size = $System_Drawing_Size
$tbx_From.TabIndex = 10
$tbx_From.Text = "test.txt"

$grp_Value.Controls.Add($tbx_From)

$lbl_From.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 91
$System_Drawing_Point.Y = 60
$lbl_From.Location = $System_Drawing_Point
$lbl_From.Name = "lbl_From"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 18
$System_Drawing_Size.Width = 38
$lbl_From.Size = $System_Drawing_Size
$lbl_From.TabIndex = 9
$lbl_From.Text = "From:"
$lbl_From.add_Click($handler_lbl_From_Click)

$grp_Value.Controls.Add($lbl_From)

$tbx_Delimiter.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 265
$System_Drawing_Point.Y = 31
$tbx_Delimiter.Location = $System_Drawing_Point
$tbx_Delimiter.Name = "tbx_Delimiter"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 99
$tbx_Delimiter.Size = $System_Drawing_Size
$tbx_Delimiter.TabIndex = 8
$tbx_Delimiter.Text = "_"

$grp_Value.Controls.Add($tbx_Delimiter)

$lbl_Numbers.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 89
$System_Drawing_Point.Y = 11
$lbl_Numbers.Location = $System_Drawing_Point
$lbl_Numbers.Name = "lbl_Numbers"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 18
$System_Drawing_Size.Width = 340
$lbl_Numbers.Size = $System_Drawing_Size
$lbl_Numbers.TabIndex = 7
$lbl_Numbers.Text = "From     To           Step        Count      Delimiter                     Zerofill"
$lbl_Numbers.add_Click($handler_label3_Click)

$grp_Value.Controls.Add($lbl_Numbers)

$nud_Count.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 222
$System_Drawing_Point.Y = 32
$nud_Count.Location = $System_Drawing_Point
$nud_Count.Name = "nud_Count"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 37
$nud_Count.Size = $System_Drawing_Size
$nud_Count.TabIndex = 6
$nud_Count.Value = 20
$nud_Count.add_ValueChanged($nud_Count_ValChange)

$grp_Value.Controls.Add($nud_Count)

$nud_Step.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 178
$System_Drawing_Point.Y = 32
$nud_Step.Location = $System_Drawing_Point
$nud_Step.Name = "nud_Step"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 38
$nud_Step.Size = $System_Drawing_Size
$nud_Step.TabIndex = 5
$nud_Step.Value = 1
$nud_Step.add_ValueChanged($nud_Step_ValChange)

$grp_Value.Controls.Add($nud_Step)

$nud_To.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 131
$System_Drawing_Point.Y = 32
$nud_To.Location = $System_Drawing_Point
$nud_To.Name = "nud_To"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 41
$nud_To.Size = $System_Drawing_Size
$nud_To.TabIndex = 4
$nud_To.Value = 20
$nud_To.add_ValueChanged($nud_To_ValChange)

$grp_Value.Controls.Add($nud_To)

$nud_From.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 91
$System_Drawing_Point.Y = 32
$nud_From.Location = $System_Drawing_Point
$nud_From.Name = "nud_From"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 34
$nud_From.Size = $System_Drawing_Size
$nud_From.TabIndex = 3
$nud_From.Value = 1
$nud_From.add_ValueChanged($nud_From_ValChange)

$grp_Value.Controls.Add($nud_From)


$rbv_List.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 6
$System_Drawing_Point.Y = 81
$rbv_List.Location = $System_Drawing_Point
$rbv_List.Name = "rbv_List"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 78
$rbv_List.Size = $System_Drawing_Size
$rbv_List.TabIndex = 2
$rbv_List.Text = "List (.xls) >"
$rbv_List.UseVisualStyleBackColor = $True
$rbv_List.add_Click($rbv_Class_Click)
$rbv_List.add_CheckedChanged($handler_radioButton6_CheckedChanged)

$grp_Value.Controls.Add($rbv_List)


$rbv_Text.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 6
$System_Drawing_Point.Y = 54
$rbv_Text.Location = $System_Drawing_Point
$rbv_Text.Name = "rbv_Text"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 78
$rbv_Text.Size = $System_Drawing_Size
$rbv_Text.TabIndex = 1
$rbv_Text.Text = "Text (.txt) >"
$rbv_Text.UseVisualStyleBackColor = $True
$rbv_Text.add_Click($rbv_Text_Click)
$rbv_Text.add_CheckedChanged($handler_radioButton5_CheckedChanged)

$grp_Value.Controls.Add($rbv_Text)


$rbv_Numbers.Checked = $True
$rbv_Numbers.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 6
$System_Drawing_Point.Y = 29
$rbv_Numbers.Location = $System_Drawing_Point
$rbv_Numbers.Name = "rbv_Numbers"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 78
$rbv_Numbers.Size = $System_Drawing_Size
$rbv_Numbers.TabIndex = 0
$rbv_Numbers.TabStop = $True
$rbv_Numbers.Text = "Numbers >"
$rbv_Numbers.UseVisualStyleBackColor = $True
$rbv_Numbers.add_Click($rbv_Numbers_Click)
$rbv_Numbers.add_CheckedChanged($handler_radioButton4_CheckedChanged)

$grp_Value.Controls.Add($rbv_Numbers)


#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $frm_Sequenzer.WindowState
#Init the OnLoad event to correct the initial state of the form
$frm_Sequenzer.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$frm_Sequenzer.ShowDialog()| Out-Null

} #End Function

#Call the Function
GenerateForm
