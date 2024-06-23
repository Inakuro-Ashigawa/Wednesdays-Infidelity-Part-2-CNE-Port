function onSongEnd() {
  if (!PlayState.isStoryMode) return;
  if (campaignMisses = 30) {
    PlayState.storyPlaylist.push("last-day");
    PlayState.storyPlaylist.push("hellhole");
  } else {
    PlayState.storyPlaylist.push("sunsets");
    PlayState.storyPlaylist.push("versiculus-iratus");
  }
}