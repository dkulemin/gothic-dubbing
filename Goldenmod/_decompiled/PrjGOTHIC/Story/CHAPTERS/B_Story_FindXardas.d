
func void B_Story_FindXardas()
{
	Log_CreateTopic(CH4_FindXardas,LOG_MISSION);
	Log_SetTopicStatus(CH4_FindXardas,LOG_RUNNING);
	B_LogEntry(CH4_FindXardas,"¬се маги огн€ были убиты.  роме одного. —атурас рассказал мне, что в создании барьера участвовали тринадцать магов. “олько этот, последний, может помочь взорвать руду.");
	B_LogEntry(CH4_FindXardas,"“ринадцатый маг, известный под именем  сардас, живет уединенно пр€мо посреди орочьих земель. я согласилс€ пойти туда, чтобы просить о помощи.");
	Wld_InsertNpc(XardasDemon,"DT_E1_06");
	FindXardas = TRUE;
};

