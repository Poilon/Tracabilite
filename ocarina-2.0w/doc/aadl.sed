s/\([^@]\)@\([^@]\)/\1@@\2/g
s/@@/@@@@/g
s/_@_/_@@_/g
s/{/\@{/g
s/}/\@}/g
s/-- \(.*\)$/-- @i{\1}/
s/\([^-][^-][^"]*\)"\([^"]*\)"/\1"@i{\2}"/g
s/^\([^-]* \)aadlboolean/\1@b{aadlboolean}/g
s/^\( *\)aadlboolean /\1@b{aadlboolean} /g
s/^aadlboolean$/@b{aadlboolean}/g
s/^\([^-]* \)aadlinteger/\1@b{aadlinteger}/g
s/^\( *\)aadlinteger /\1@b{aadlinteger} /g
s/^aadlinteger$/@b{aadlinteger}/g
s/^\([^-]* \)aadlreal/\1@b{aadlreal}/g
s/^\( *\)aadlreal /\1@b{aadlreal} /g
s/^aadlreal$/@b{aadlreal}/g
s/^\([^-]* \)aadlstring/\1@b{aadlstring}/g
s/^\( *\)aadlstring /\1@b{aadlstring} /g
s/^aadlstring$/@b{aadlstring}/g
s/^\([^-]* \)access/\1@b{access}/g
s/^\( *\)access /\1@b{access} /g
s/^access$/@b{access}/g
s/^\([^-]* \)all/\1@b{all}/g
s/^\( *\)all /\1@b{all} /g
s/^all$/@b{all}/g
s/^\([^-]* \)and/\1@b{and}/g
s/^\( *\)and /\1@b{and} /g
s/^and$/@b{and}/g
s/^\([^-]* \)annex/\1@b{annex}/g
s/^\( *\)annex /\1@b{annex} /g
s/^annex$/@b{annex}/g
s/^\([^-]* \)applies/\1@b{applies}/g
s/^\( *\)applies /\1@b{applies} /g
s/^applies$/@b{applies}/g
s/^\([^-]* \)binding/\1@b{binding}/g
s/^\( *\)binding /\1@b{binding} /g
s/^binding$/@b{binding}/g
s/^\([^-]* \)bus/\1@b{bus}/g
s/^\( *\)bus /\1@b{bus} /g
s/^bus$/@b{bus}/g
s/^\([^-]* \)calls/\1@b{calls}/g
s/^\( *\)calls /\1@b{calls} /g
s/^calls$/@b{calls}/g
s/^\([^-]* \)classifier/\1@b{classifier}/g
s/^\( *\)classifier /\1@b{classifier} /g
s/^classifier$/@b{classifier}/g
s/^\([^-]* \)connections/\1@b{connections}/g
s/^\( *\)connections /\1@b{connections} /g
s/^connections$/@b{connections}/g
s/^\([^-]* \)constant/\1@b{constant}/g
s/^\( *\)constant /\1@b{constant} /g
s/^constant$/@b{constant}/g
s/^\([^-]* \)data/\1@b{data}/g
s/^\( *\)data /\1@b{data} /g
s/^data$/@b{data}/g
s/^\([^-]* \)delta/\1@b{delta}/g
s/^\( *\)delta /\1@b{delta} /g
s/^delta$/@b{delta}/g
s/^\([^-]* \)device/\1@b{device}/g
s/^\( *\)device /\1@b{device} /g
s/^device$/@b{device}/g
s/^\([^-]* \)end/\1@b{end}/g
s/^\( *\)end /\1@b{end} /g
s/^end$/@b{end}/g
s/^\([^-]* \)enumeration/\1@b{enumeration}/g
s/^\( *\)enumeration /\1@b{enumeration} /g
s/^enumeration$/@b{enumeration}/g
s/^\([^-]* \)event/\1@b{event}/g
s/^\( *\)event /\1@b{event} /g
s/^event$/@b{event}/g
s/^\([^-]* \)extends/\1@b{extends}/g
s/^\( *\)extends /\1@b{extends} /g
s/^extends$/@b{extends}/g
s/^\([^-]* \)false/\1@b{false}/g
s/^\( *\)false /\1@b{false} /g
s/^false$/@b{false}/g
s/^\([^-]* \)features/\1@b{features}/g
s/^\( *\)features /\1@b{features} /g
s/^features$/@b{features}/g
s/^\([^-]* \)flow/\1@b{flow}/g
s/^\( *\)flow /\1@b{flow} /g
s/^flow$/@b{flow}/g
s/^\([^-]* \)flows/\1@b{flows}/g
s/^\( *\)flows /\1@b{flows} /g
s/^flows$/@b{flows}/g
s/^\([^-]* \)group/\1@b{group}/g
s/^\( *\)group /\1@b{group} /g
s/^group$/@b{group}/g
s/^\([^-]* \)implementation/\1@b{implementation}/g
s/^\( *\)implementation /\1@b{implementation} /g
s/^implementation$/@b{implementation}/g
s/^\([^-]* \)in/\1@b{in}/g
s/^\( *\)in /\1@b{in} /g
s/^in$/@b{in}/g
s/^\([^-]* \)inherit/\1@b{inherit}/g
s/^\( *\)inherit /\1@b{inherit} /g
s/^inherit$/@b{inherit}/g
s/^\([^-]* \)initial/\1@b{initial}/g
s/^\( *\)initial /\1@b{initial} /g
s/^initial$/@b{initial}/g
s/^\([^-]* \)inverse/\1@b{inverse}/g
s/^\( *\)inverse /\1@b{inverse} /g
s/^inverse$/@b{inverse}/g
s/^\([^-]* \)is/\1@b{is}/g
s/^\( *\)is /\1@b{is} /g
s/^is$/@b{is}/g
s/^\([^-]* \)list/\1@b{list}/g
s/^\( *\)list /\1@b{list} /g
s/^list$/@b{list}/g
s/^\([^-]* \)memory/\1@b{memory}/g
s/^\( *\)memory /\1@b{memory} /g
s/^memory$/@b{memory}/g
s/^\([^-]* \)mode/\1@b{mode}/g
s/^\( *\)mode /\1@b{mode} /g
s/^mode$/@b{mode}/g
s/^\([^-]* \)modes/\1@b{modes}/g
s/^\( *\)modes /\1@b{modes} /g
s/^modes$/@b{modes}/g
s/^\([^-]* \)none/\1@b{none}/g
s/^\( *\)none /\1@b{none} /g
s/^none$/@b{none}/g
s/^\([^-]* \)not/\1@b{not}/g
s/^\( *\)not /\1@b{not} /g
s/^not$/@b{not}/g
s/^\([^-]* \)of/\1@b{of}/g
s/^\( *\)of /\1@b{of} /g
s/^of$/@b{of}/g
s/^\([^-]* \)or/\1@b{or}/g
s/^\( *\)or /\1@b{or} /g
s/^or$/@b{or}/g
s/^\([^-]* \)out/\1@b{out}/g
s/^\( *\)out /\1@b{out} /g
s/^out$/@b{out}/g
s/^\([^-]* \)package/\1@b{package}/g
s/^\( *\)package /\1@b{package} /g
s/^package$/@b{package}/g
s/^\([^-]* \)parameter/\1@b{parameter}/g
s/^\( *\)parameter /\1@b{parameter} /g
s/^parameter$/@b{parameter}/g
s/^\([^-]* \)path/\1@b{path}/g
s/^\( *\)path /\1@b{path} /g
s/^path$/@b{path}/g
s/^\([^-]* \)port/\1@b{port}/g
s/^\( *\)port /\1@b{port} /g
s/^port$/@b{port}/g
s/^\([^-]* \)private/\1@b{private}/g
s/^\( *\)private /\1@b{private} /g
s/^private$/@b{private}/g
s/^\([^-]* \)process/\1@b{process}/g
s/^\( *\)process /\1@b{process} /g
s/^process$/@b{process}/g
s/^\([^-]* \)processor/\1@b{processor}/g
s/^\( *\)processor /\1@b{processor} /g
s/^processor$/@b{processor}/g
s/^\([^-]* \)properties/\1@b{properties}/g
s/^\( *\)properties /\1@b{properties} /g
s/^properties$/@b{properties}/g
s/^\([^-]* \)property/\1@b{property}/g
s/^\( *\)property /\1@b{property} /g
s/^property$/@b{property}/g
s/^\([^-]* \)provides/\1@b{provides}/g
s/^\( *\)provides /\1@b{provides} /g
s/^provides$/@b{provides}/g
s/^\([^-]* \)public/\1@b{public}/g
s/^\( *\)public /\1@b{public} /g
s/^public$/@b{public}/g
s/^\([^-]* \)range/\1@b{range}/g
s/^\( *\)range /\1@b{range} /g
s/^range$/@b{range}/g
s/^\([^-]* \)reference/\1@b{reference}/g
s/^\( *\)reference /\1@b{reference} /g
s/^reference$/@b{reference}/g
s/^\([^-]* \)refined/\1@b{refined}/g
s/^\( *\)refined /\1@b{refined} /g
s/^refined$/@b{refined}/g
s/^\([^-]* \)refines/\1@b{refines}/g
s/^\( *\)refines /\1@b{refines} /g
s/^refines$/@b{refines}/g
s/^\([^-]* \)requires/\1@b{requires}/g
s/^\( *\)requires /\1@b{requires} /g
s/^requires$/@b{requires}/g
s/^\([^-]* \)server/\1@b{server}/g
s/^\( *\)server /\1@b{server} /g
s/^server$/@b{server}/g
s/^\([^-]* \)set/\1@b{set}/g
s/^\( *\)set /\1@b{set} /g
s/^set$/@b{set}/g
s/^\([^-]* \)sink/\1@b{sink}/g
s/^\( *\)sink /\1@b{sink} /g
s/^sink$/@b{sink}/g
s/^\([^-]* \)source/\1@b{source}/g
s/^\( *\)source /\1@b{source} /g
s/^source$/@b{source}/g
s/^\([^-]* \)subcomponents/\1@b{subcomponents}/g
s/^\( *\)subcomponents /\1@b{subcomponents} /g
s/^subcomponents$/@b{subcomponents}/g
s/^\([^-]* \)subprogram/\1@b{subprogram}/g
s/^\( *\)subprogram /\1@b{subprogram} /g
s/^subprogram$/@b{subprogram}/g
s/^\([^-]* \)system/\1@b{system}/g
s/^\( *\)system /\1@b{system} /g
s/^system$/@b{system}/g
s/^\([^-]* \)thread/\1@b{thread}/g
s/^\( *\)thread /\1@b{thread} /g
s/^thread$/@b{thread}/g
s/^\([^-]* \)to/\1@b{to}/g
s/^\( *\)to /\1@b{to} /g
s/^to$/@b{to}/g
s/^\([^-]* \)true/\1@b{true}/g
s/^\( *\)true /\1@b{true} /g
s/^true$/@b{true}/g
s/^\([^-]* \)type/\1@b{type}/g
s/^\( *\)type /\1@b{type} /g
s/^type$/@b{type}/g
s/^\([^-]* \)units/\1@b{units}/g
s/^\( *\)units /\1@b{units} /g
s/^units$/@b{units}/g
s/^\([^-]* \)value/\1@b{value}/g
s/^\( *\)value /\1@b{value} /g
s/^value$/@b{value}/g
