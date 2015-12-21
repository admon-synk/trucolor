'use strict'
###
 trucolor (v0.0.20) 24bit color tools for the command  line
 Color Output Parser
###
console = global.vconsole
ColorIn = require "./colorIn"
ColorOut = require "./colorOut"

class Gamut
	constructor: (@sgr, @colorIn) ->
		@color = new ColorOut @sgr, @colorIn
		@distance = Infinity

	resolve: (r, g, b) ->
		db = (@color.blue - b) ** 2
		dg = (@color.green - g) ** 2
		dr = (@color.red - r) ** 2
		@distance = Math.sqrt (dr + dg + db)

	find: (d) ->
		@distance is d

	valueOf: ->
		@distance

# console.dir colorSupport

switch
	when colorSupport.has256
		prefix=';5;'
		ansi = [
			new Gamut '0',   '#000000'
			new Gamut '1',   '#800000'
			new Gamut '2',   '#008000'
			new Gamut '3',   '#808000'
			new Gamut '4',   '#000080'
			new Gamut '5',   '#800080'
			new Gamut '6',   '#008080'
			new Gamut '7',   '#c0c0c0'
			new Gamut '8',   '#808080'
			new Gamut '9',   '#ff0000'
			new Gamut '10',  '#00ff00'
			new Gamut '11',  '#ffff00'
			new Gamut '12',  '#0000ff'
			new Gamut '13',  '#ff00ff'
			new Gamut '14',  '#00ffff'
			new Gamut '15',  '#ffffff'
			new Gamut '16',  '#000000'
			new Gamut '17',  '#00005f'
			new Gamut '18',  '#000087'
			new Gamut '19',  '#0000af'
			new Gamut '20',  '#0000d7'
			new Gamut '21',  '#0000ff'
			new Gamut '22',  '#005f00'
			new Gamut '23',  '#005f5f'
			new Gamut '24',  '#005f87'
			new Gamut '25',  '#005faf'
			new Gamut '26',  '#005fd7'
			new Gamut '27',  '#005fff'
			new Gamut '28',  '#008700'
			new Gamut '29',  '#00875f'
			new Gamut '30',  '#008787'
			new Gamut '31',  '#0087af'
			new Gamut '32',  '#0087d7'
			new Gamut '33',  '#0087ff'
			new Gamut '34',  '#00af00'
			new Gamut '35',  '#00af5f'
			new Gamut '36',  '#00af87'
			new Gamut '37',  '#00afaf'
			new Gamut '38',  '#00afd7'
			new Gamut '39',  '#00afff'
			new Gamut '40',  '#00d700'
			new Gamut '41',  '#00d75f'
			new Gamut '42',  '#00d787'
			new Gamut '43',  '#00d7af'
			new Gamut '44',  '#00d7d7'
			new Gamut '45',  '#00d7ff'
			new Gamut '46',  '#00ff00'
			new Gamut '47',  '#00ff5f'
			new Gamut '48',  '#00ff87'
			new Gamut '49',  '#00ffaf'
			new Gamut '50',  '#00ffd7'
			new Gamut '51',  '#00ffff'
			new Gamut '52',  '#5f0000'
			new Gamut '53',  '#5f005f'
			new Gamut '54',  '#5f0087'
			new Gamut '55',  '#5f00af'
			new Gamut '56',  '#5f00d7'
			new Gamut '57',  '#5f00ff'
			new Gamut '58',  '#5f5f00'
			new Gamut '59',  '#5f5f5f'
			new Gamut '60',  '#5f5f87'
			new Gamut '61',  '#5f5faf'
			new Gamut '62',  '#5f5fd7'
			new Gamut '63',  '#5f5fff'
			new Gamut '64',  '#5f8700'
			new Gamut '65',  '#5f875f'
			new Gamut '66',  '#5f8787'
			new Gamut '67',  '#5f87af'
			new Gamut '68',  '#5f87d7'
			new Gamut '69',  '#5f87ff'
			new Gamut '70',  '#5faf00'
			new Gamut '71',  '#5faf5f'
			new Gamut '72',  '#5faf87'
			new Gamut '73',  '#5fafaf'
			new Gamut '74',  '#5fafd7'
			new Gamut '75',  '#5fafff'
			new Gamut '76',  '#5fd700'
			new Gamut '77',  '#5fd75f'
			new Gamut '78',  '#5fd787'
			new Gamut '79',  '#5fd7af'
			new Gamut '80',  '#5fd7d7'
			new Gamut '81',  '#5fd7ff'
			new Gamut '82',  '#5fff00'
			new Gamut '83',  '#5fff5f'
			new Gamut '84',  '#5fff87'
			new Gamut '85',  '#5fffaf'
			new Gamut '86',  '#5fffd7'
			new Gamut '87',  '#5fffff'
			new Gamut '88',  '#870000'
			new Gamut '89',  '#87005f'
			new Gamut '90',  '#870087'
			new Gamut '91',  '#8700af'
			new Gamut '92',  '#8700d7'
			new Gamut '93',  '#8700ff'
			new Gamut '94',  '#875f00'
			new Gamut '95',  '#875f5f'
			new Gamut '96',  '#875f87'
			new Gamut '97',  '#875faf'
			new Gamut '98',  '#875fd7'
			new Gamut '99',  '#875fff'
			new Gamut '100', '#878700'
			new Gamut '101', '#87875f'
			new Gamut '102', '#878787'
			new Gamut '103', '#8787af'
			new Gamut '104', '#8787d7'
			new Gamut '105', '#8787ff'
			new Gamut '106', '#87af00'
			new Gamut '107', '#87af5f'
			new Gamut '108', '#87af87'
			new Gamut '109', '#87afaf'
			new Gamut '110', '#87afd7'
			new Gamut '111', '#87afff'
			new Gamut '112', '#87d700'
			new Gamut '113', '#87d75f'
			new Gamut '114', '#87d787'
			new Gamut '115', '#87d7af'
			new Gamut '116', '#87d7d7'
			new Gamut '117', '#87d7ff'
			new Gamut '118', '#87ff00'
			new Gamut '119', '#87ff5f'
			new Gamut '120', '#87ff87'
			new Gamut '121', '#87ffaf'
			new Gamut '122', '#87ffd7'
			new Gamut '123', '#87ffff'
			new Gamut '124', '#af0000'
			new Gamut '125', '#af005f'
			new Gamut '126', '#af0087'
			new Gamut '127', '#af00af'
			new Gamut '128', '#af00d7'
			new Gamut '129', '#af00ff'
			new Gamut '130', '#af5f00'
			new Gamut '131', '#af5f5f'
			new Gamut '132', '#af5f87'
			new Gamut '133', '#af5faf'
			new Gamut '134', '#af5fd7'
			new Gamut '135', '#af5fff'
			new Gamut '136', '#af8700'
			new Gamut '137', '#af875f'
			new Gamut '138', '#af8787'
			new Gamut '139', '#af87af'
			new Gamut '140', '#af87d7'
			new Gamut '141', '#af87ff'
			new Gamut '142', '#afaf00'
			new Gamut '143', '#afaf5f'
			new Gamut '144', '#afaf87'
			new Gamut '145', '#afafaf'
			new Gamut '146', '#afafd7'
			new Gamut '147', '#afafff'
			new Gamut '148', '#afd700'
			new Gamut '149', '#afd75f'
			new Gamut '150', '#afd787'
			new Gamut '151', '#afd7af'
			new Gamut '152', '#afd7d7'
			new Gamut '153', '#afd7ff'
			new Gamut '154', '#afff00'
			new Gamut '155', '#afff5f'
			new Gamut '156', '#afff87'
			new Gamut '157', '#afffaf'
			new Gamut '158', '#afffd7'
			new Gamut '159', '#afffff'
			new Gamut '160', '#d70000'
			new Gamut '161', '#d7005f'
			new Gamut '162', '#d70087'
			new Gamut '163', '#d700af'
			new Gamut '164', '#d700d7'
			new Gamut '165', '#d700ff'
			new Gamut '166', '#d75f00'
			new Gamut '167', '#d75f5f'
			new Gamut '168', '#d75f87'
			new Gamut '169', '#d75faf'
			new Gamut '170', '#d75fd7'
			new Gamut '171', '#d75fff'
			new Gamut '172', '#d78700'
			new Gamut '173', '#d7875f'
			new Gamut '174', '#d78787'
			new Gamut '175', '#d787af'
			new Gamut '176', '#d787d7'
			new Gamut '177', '#d787ff'
			new Gamut '178', '#d7af00'
			new Gamut '179', '#d7af5f'
			new Gamut '180', '#d7af87'
			new Gamut '181', '#d7afaf'
			new Gamut '182', '#d7afd7'
			new Gamut '183', '#d7afff'
			new Gamut '184', '#d7d700'
			new Gamut '185', '#d7d75f'
			new Gamut '186', '#d7d787'
			new Gamut '187', '#d7d7af'
			new Gamut '188', '#d7d7d7'
			new Gamut '189', '#d7d7ff'
			new Gamut '190', '#d7ff00'
			new Gamut '191', '#d7ff5f'
			new Gamut '192', '#d7ff87'
			new Gamut '193', '#d7ffaf'
			new Gamut '194', '#d7ffd7'
			new Gamut '195', '#d7ffff'
			new Gamut '196', '#ff0000'
			new Gamut '197', '#ff005f'
			new Gamut '198', '#ff0087'
			new Gamut '199', '#ff00af'
			new Gamut '200', '#ff00d7'
			new Gamut '201', '#ff00ff'
			new Gamut '202', '#ff5f00'
			new Gamut '203', '#ff5f5f'
			new Gamut '204', '#ff5f87'
			new Gamut '205', '#ff5faf'
			new Gamut '206', '#ff5fd7'
			new Gamut '207', '#ff5fff'
			new Gamut '208', '#ff8700'
			new Gamut '209', '#ff875f'
			new Gamut '210', '#ff8787'
			new Gamut '211', '#ff87af'
			new Gamut '212', '#ff87d7'
			new Gamut '213', '#ff87ff'
			new Gamut '214', '#ffaf00'
			new Gamut '215', '#ffaf5f'
			new Gamut '216', '#ffaf87'
			new Gamut '217', '#ffafaf'
			new Gamut '218', '#ffafd7'
			new Gamut '219', '#ffafff'
			new Gamut '220', '#ffd700'
			new Gamut '221', '#ffd75f'
			new Gamut '222', '#ffd787'
			new Gamut '223', '#ffd7af'
			new Gamut '224', '#ffd7d7'
			new Gamut '225', '#ffd7ff'
			new Gamut '226', '#ffff00'
			new Gamut '227', '#ffff5f'
			new Gamut '228', '#ffff87'
			new Gamut '229', '#ffffaf'
			new Gamut '230', '#ffffd7'
			new Gamut '231', '#ffffff'
			new Gamut '232', '#080808'
			new Gamut '233', '#121212'
			new Gamut '234', '#1c1c1c'
			new Gamut '235', '#262626'
			new Gamut '236', '#303030'
			new Gamut '237', '#3a3a3a'
			new Gamut '238', '#444444'
			new Gamut '239', '#4e4e4e'
			new Gamut '240', '#585858'
			new Gamut '241', '#606060'
			new Gamut '242', '#666666'
			new Gamut '243', '#767676'
			new Gamut '244', '#808080'
			new Gamut '245', '#8a8a8a'
			new Gamut '246', '#949494'
			new Gamut '247', '#9e9e9e'
			new Gamut '248', '#a8a8a8'
			new Gamut '249', '#b2b2b2'
			new Gamut '250', '#bcbcbc'
			new Gamut '251', '#c6c6c6'
			new Gamut '252', '#d0d0d0'
			new Gamut '253', '#dadada'
			new Gamut '254', '#e4e4e4'
			new Gamut '255', '#eeeeee'
		]
	when colorSupport.hasBasic
		prefix = ''
		ansi = [
			new Gamut '30', '#000000'
			new Gamut '31', '#800000'
			new Gamut '32', '#008000'
			new Gamut '33', '#808000'
			new Gamut '34', '#000080'
			new Gamut '35', '#800080'
			new Gamut '36', '#008080'
			new Gamut '37', '#c0c0c0'
			new Gamut '90', '#808080'
			new Gamut '91', '#ff0000'
			new Gamut '92',  '#00ff00'
			new Gamut '93',  '#ffff00'
			new Gamut '94',  '#0000ff'
			new Gamut '95',  '#ff00ff'
			new Gamut '96',  '#00ffff'
			new Gamut '97',  '#ffffff'
		]

exports.find = (r, g, b) =>
	ansi.forEach (gamut) -> gamut.resolve r, g, b

	closest = Math.min.apply @, ansi
	for gamut in ansi
		if gamut.find closest
			closestMap = gamut
			break

	console.dir closestMap

