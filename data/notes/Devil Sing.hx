var singDir = ["LEFT", "DOWN", "UP", "RIGHT"];

function onNoteHit(note:NoteHitEvent){
    var curNotes = note.noteType;

    switch(curNotes){
    case "Devil Sing":
        strumLines.members[3].characters[0].playAnim("sing" + singDir[note.direction], true);
        note.cancelAnim();
        note.healthGain += 0.002;
    }
}
function update()
{
if(strumLines.members[3].characters[0].animation.curAnim.name == "idle"){
	strumLines.members[3].characters[0].alpha = 0.0000000000001;
}
else
	strumLines.members[3].characters[0].alpha = 1;
}