
func void db_say(var C_Npc slf,var C_Npc oth,var string text)
{
	B_SmartTurnToNpc(slf,oth);
	if((slf.voice > 0) && (slf.voice < 15))
	{
		AI_OutputSVM_Overlay(slf,oth,ConcatStrings("$",text));
		Snd_Play3d(slf,ConcatStrings(ConcatStrings("SVM",IntToString(slf.voice)),text));
	};
};

