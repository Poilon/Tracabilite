s/\([^@]\)@\([^@]\)/\1@@\2/g
s/@@/@@@@/g
s/_@_/_@@_/g
s/{/\@{/g
s/}/\@}/g
s/-- \(.*\)$/-- @i{\1}/
s/\([^-][^-][^"]*\)"\([^"]*\)"/\1"@i{\2}"/g
s/^\([^-]* \)with/\1@b{with}/g
s/^\( *\)with /\1@b{with} /g
s/^with$/@b{with}/g
s/^\([^-]* \)while/\1@b{while}/g
s/^\( *\)while /\1@b{while} /g
s/^while$/@b{while}/g
s/^\([^-]* \)when/\1@b{when}/g
s/^\( *\)when /\1@b{when} /g
s/^when$/@b{when}/g
s/^\([^-]* \)use/\1@b{use}/g
s/^\( *\)use /\1@b{use} /g
s/^use$/@b{use}/g
s/^\([^-]* \)until/\1@b{until}/g
s/^\( *\)until /\1@b{until} /g
s/^until$/@b{until}/g
s/^\([^-]* \)type/\1@b{type}/g
s/^\( *\)type /\1@b{type} /g
s/^type$/@b{type}/g
s/^\([^-]* \)then/\1@b{then}/g
s/^\( *\)then /\1@b{then} /g
s/^then$/@b{then}/g
s/^\([^-]* \)terminate/\1@b{terminate}/g
s/^\( *\)terminate /\1@b{terminate} /g
s/^terminate$/@b{terminate}/g
s/^\([^-]* \)task/\1@b{task}/g
s/^\( *\)task /\1@b{task} /g
s/^task$/@b{task}/g
s/^\([^-]* \)tagged/\1@b{tagged}/g
s/^\( *\)tagged /\1@b{tagged} /g
s/^tagged$/@b{tagged}/g
s/^\([^-]* \)subtype/\1@b{subtype}/g
s/^\( *\)subtype /\1@b{subtype} /g
s/^subtype$/@b{subtype}/g
s/^\([^-]* \)separate/\1@b{separate}/g
s/^\( *\)separate /\1@b{separate} /g
s/^separate$/@b{separate}/g
s/^\([^-]* \)select/\1@b{select}/g
s/^\( *\)select /\1@b{select} /g
s/^select$/@b{select}/g
s/^\([^-]* \)reverse/\1@b{reverse}/g
s/^\( *\)reverse /\1@b{reverse} /g
s/^reverse$/@b{reverse}/g
s/^\([^-]* \)reverse/\1@b{reverse}/g
s/^\( *\)reverse /\1@b{reverse} /g
s/^reverse$/@b{reverse}/g
s/^\([^-]* \)return/\1@b{return}/g
s/^\( *\)return /\1@b{return} /g
s/^return$/@b{return}/g
s/^\([^-]* \)requeue/\1@b{requeue}/g
s/^\( *\)requeue /\1@b{requeue} /g
s/^requeue$/@b{requeue}/g
s/^\([^-]* \)renames/\1@b{renames}/g
s/^\( *\)renames /\1@b{renames} /g
s/^renames$/@b{renames}/g
s/^\([^-]* \)rem/\1@b{rem}/g
s/^\( *\)rem /\1@b{rem} /g
s/^rem$/@b{rem}/g
s/^\([^-]* \)record/\1@b{record}/g
s/^\( *\)record /\1@b{record} /g
s/^record$/@b{record}/g
s/^\([^-]* \)range/\1@b{range}/g
s/^\( *\)range /\1@b{range} /g
s/^range$/@b{range}/g
s/^\([^-]* \)raise/\1@b{raise}/g
s/^\( *\)raise /\1@b{raise} /g
s/^raise$/@b{raise}/g
s/^\([^-]* \)protected/\1@b{protected}/g
s/^\( *\)protected /\1@b{protected} /g
s/^protected$/@b{protected}/g
s/^\([^-]* \)procedure/\1@b{procedure}/g
s/^\( *\)procedure /\1@b{procedure} /g
s/^procedure$/@b{procedure}/g
s/^\([^-]* \)private/\1@b{private}/g
s/^\( *\)private /\1@b{private} /g
s/^private$/@b{private}/g
s/^\([^-]* \)pragma/\1@b{pragma}/g
s/^\( *\)pragma /\1@b{pragma} /g
s/^pragma$/@b{pragma}/g
s/^\([^-]* \)package/\1@b{package}/g
s/^\( *\)package /\1@b{package} /g
s/^package$/@b{package}/g
s/^\([^-]* \)out/\1@b{out}/g
s/^\( *\)out /\1@b{out} /g
s/^out$/@b{out}/g
s/^\([^-]* \)others/\1@b{others}/g
s/^\( *\)others /\1@b{others} /g
s/^others$/@b{others}/g
s/^\([^-]* \)or/\1@b{or}/g
s/^\( *\)or /\1@b{or} /g
s/^or$/@b{or}/g
s/^\([^-]* \)of/\1@b{of}/g
s/^\( *\)of /\1@b{of} /g
s/^of$/@b{of}/g
s/^\([^-]* \)null/\1@b{null}/g
s/^\( *\)null /\1@b{null} /g
s/^null$/@b{null}/g
s/^\([^-]* \)not/\1@b{not}/g
s/^\( *\)not /\1@b{not} /g
s/^not$/@b{not}/g
s/^\([^-]* \)new/\1@b{new}/g
s/^\( *\)new /\1@b{new} /g
s/^new$/@b{new}/g
s/^\([^-]* \)mod/\1@b{mod}/g
s/^\( *\)mod /\1@b{mod} /g
s/^mod$/@b{mod}/g
s/^\([^-]* \)loop/\1@b{loop}/g
s/^\( *\)loop /\1@b{loop} /g
s/^loop$/@b{loop}/g
s/^\([^-]* \)limited/\1@b{limited}/g
s/^\( *\)limited /\1@b{limited} /g
s/^limited$/@b{limited}/g
s/^\([^-]* \)is/\1@b{is}/g
s/^\( *\)is /\1@b{is} /g
s/^is$/@b{is}/g
s/^\([^-]* \)in/\1@b{in}/g
s/^\( *\)in /\1@b{in} /g
s/^in$/@b{in}/g
s/^\([^-]* \)if/\1@b{if}/g
s/^\( *\)if /\1@b{if} /g
s/^if$/@b{if}/g
s/^\([^-]* \)goto/\1@b{goto}/g
s/^\( *\)goto /\1@b{goto} /g
s/^goto$/@b{goto}/g
s/^\([^-]* \)generic/\1@b{generic}/g
s/^\( *\)generic /\1@b{generic} /g
s/^generic$/@b{generic}/g
s/^\([^-]* \)function/\1@b{function}/g
s/^\( *\)function /\1@b{function} /g
s/^function$/@b{function}/g
s/^\([^-]* \)for/\1@b{for}/g
s/^\( *\)for /\1@b{for} /g
s/^for$/@b{for}/g
s/^\([^-]* \)exit/\1@b{exit}/g
s/^\( *\)exit /\1@b{exit} /g
s/^exit$/@b{exit}/g
s/^\([^-]* \)exception/\1@b{exception}/g
s/^\( *\)exception /\1@b{exception} /g
s/^exception$/@b{exception}/g
s/^\([^-]* \)entry/\1@b{entry}/g
s/^\( *\)entry /\1@b{entry} /g
s/^entry$/@b{entry}/g
s/^\([^-]* \)end/\1@b{end}/g
s/^\( *\)end /\1@b{end} /g
s/^end$/@b{end}/g
s/^\([^-]* \)elsif/\1@b{elsif}/g
s/^\( *\)elsif /\1@b{elsif} /g
s/^elsif$/@b{elsif}/g
s/^\([^-]* \)else/\1@b{else}/g
s/^\( *\)else /\1@b{else} /g
s/^else$/@b{else}/g
s/^\([^-]* \)do/\1@b{do}/g
s/^\( *\)do /\1@b{do} /g
s/^do$/@b{do}/g
s/^\([^-]* \)digits/\1@b{digits}/g
s/^\( *\)digits /\1@b{digits} /g
s/^digits$/@b{digits}/g
s/^\([^-]* \)delta/\1@b{delta}/g
s/^\( *\)delta /\1@b{delta} /g
s/^delta$/@b{delta}/g
s/^\([^-]* \)delay/\1@b{delay}/g
s/^\( *\)delay /\1@b{delay} /g
s/^delay$/@b{delay}/g
s/^\([^-]* \)declare/\1@b{declare}/g
s/^\( *\)declare /\1@b{declare} /g
s/^declare$/@b{declare}/g
s/^\([^-]* \)constant/\1@b{constant}/g
s/^\( *\)constant /\1@b{constant} /g
s/^constant$/@b{constant}/g
s/^\([^-]* \)configuration/\1@b{configuration}/g
s/^\( *\)configuration /\1@b{configuration} /g
s/^configuration$/@b{configuration}/g
s/^\([^-]* \)case/\1@b{case}/g
s/^\( *\)case /\1@b{case} /g
s/^case$/@b{case}/g
s/^\([^-]* \)body/\1@b{body}/g
s/^\( *\)body /\1@b{body} /g
s/^body$/@b{body}/g
s/^\([^-]* \)begin/\1@b{begin}/g
s/^\( *\)begin /\1@b{begin} /g
s/^begin$/@b{begin}/g
s/^\([^-]* \)array/\1@b{array}/g
s/^\( *\)array /\1@b{array} /g
s/^array$/@b{array}/g
s/^\([^-]* \)and/\1@b{and}/g
s/^\( *\)and /\1@b{and} /g
s/^and$/@b{and}/g
s/^\([^-]* \)all/\1@b{all}/g
s/^\( *\)all /\1@b{all} /g
s/^all$/@b{all}/g
s/^\([^-]* \)aliased/\1@b{aliased}/g
s/^\( *\)aliased /\1@b{aliased} /g
s/^aliased$/@b{aliased}/g
s/^\([^-]* \)access/\1@b{access}/g
s/^\( *\)access /\1@b{access} /g
s/^access$/@b{access}/g
s/^\([^-]* \)accept/\1@b{accept}/g
s/^\( *\)accept /\1@b{accept} /g
s/^accept$/@b{accept}/g
s/^\([^-]* \)abstract/\1@b{abstract}/g
s/^\( *\)abstract /\1@b{abstract} /g
s/^abstract$/@b{abstract}/g
s/^\([^-]* \)abs/\1@b{abs}/g
s/^\( *\)abs /\1@b{abs} /g
s/^abs$/@b{abs}/g
s/^\([^-]* \)abort/\1@b{abort}/g
s/^\( *\)abort /\1@b{abort} /g
s/^abort$/@b{abort}/g
