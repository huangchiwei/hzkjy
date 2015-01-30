/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	 config.language = 'zh-cn';
	 config.removePlugins = 'elementspath';
	// config.toolbar = 'Full'; //Basic Full
	// config.uiColor = '#AADC6E';
/*	 config.toolbar_Full = [
['Source','-','Save','NewPage','Preview','-','Templates'],
['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
'/',
['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
['Link','Unlink','Anchor'],
['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
'/',
['Styles','Format','Font','FontSize'],
['TextColor','BGColor']
];*/
	 config.toolbar_Full = [

['Bold','Italic','Underline','Strike','-'],
['NumberedList','BulletedList','-'],
['JustifyLeft','JustifyCenter','JustifyRight'],
['Image'],
'/',
['Styles','Format','Font','FontSize'],
['TextColor','BGColor']
];
};
