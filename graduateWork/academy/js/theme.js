var home = 'http://140.112.162.58/';
var myMenu =
[
    ['', '<div id=menuA1 class=menuA></div>', '#', '_self', '',   // a folder item
        ['', '<div id=menuA2 class=menuA></div>', home + 'camp/About-Orientation-Camp.html', '_self', ''],
        ['', '<div id=menuA3 class=menuA></div>', home + 'camp/Programs.html', '_self', ''],
        ['', '<div id=menuA4 class=menuA></div>', home + 'camp/Staff-Bios.html', '_self', ''],
		['', '<div id=menuA5 class=menuA></div>', home + 'camp/Student-Staff.html', '_self', ''],
    ],
	['', '<div id=menuB1 class=menu></div>', home + 'camp/Agenda.html', '_self', ''],  // a menu item
    ['', '<div id=menuC1 class=menuC></div>', '#', '_self', '',
        ['', '<div id=menuC2 class=menuC></div>', home + 'camp/Travel-Arrangement.html', '_self', ''],
        ['', '<div id=menuC3 class=menuC></div>', home + 'camp/Housing.html', '_self', ''],
		['', '<div id=menuC4 class=menuC></div>', home + 'camp/Meal.html', '_self', ''],
		['', '<div id=menuC5 class=menuC></div>', home + 'camp/Items-to-Bring.html', '_self', ''],
    ],		
	['', '<div id=menuD1 class=menu></div>', '#', '_self', ''],
	['', '<div id=menuE1 class=menu></div>', home + 'camp/FAQ.html', '_self', ''],
	['', '<div id=menuF1 class=menu></div>', home + 'camp/Contact-Us.html', '_self', ''],
];

/*
 * ThemeGray by Ian Reyes and Heng Yuan
 */
var cmThemeGray =
{
	prefix:	'ThemeGray',
  	// main menu display attributes
  	//
  	// Note.  When the menu bar is horizontal,
  	// mainFolderLeft and mainFolderRight are
  	// put in <span></span>.  When the menu
  	// bar is vertical, they would be put in
  	// a separate TD cell.

  	// HTML code to the left of the folder item
  	mainFolderLeft: '',
  	// HTML code to the right of the folder item
  	mainFolderRight: '',
	// HTML code to the left of the regular item
	mainItemLeft: '',
	// HTML code to the right of the regular item
	mainItemRight: '',

	// sub menu display attributes

	// HTML code to the left of the folder item
	folderLeft: '>',
	// HTML code to the right of the folder item
	folderRight: '&lt;',
	// HTML code to the left of the regular item
	itemLeft: '',
	// HTML code to the right of the regular item
	itemRight: '',
	// cell spacing for main menu
	mainSpacing: 0,
	// cell spacing for sub menus
	subSpacing: 0,
	// auto dispear time for submenus in milli-seconds
	delay: 50

	// rest use default settings
};
// for sub menu horizontal split
var cmThemeGrayHSplit = [_cmNoClick, '<td colspan="3" class="ThemeGrayMenuSplit"><div class="ThemeGrayMenuSplit"></div></td>'];
// for vertical main menu horizontal split
var cmThemeGrayMainHSplit = [_cmNoClick, '<td colspan="3" class="ThemeGrayMenuSplit"><div class="ThemeGrayMenuSplit"></div></td>'];
// for horizontal main menu vertical split
var cmThemeGrayMainVSplit = [_cmNoClick, '|'];