Intent request = new Intent();

// Try to send the intent
try {
    // Sets properties on the intent
    request.setComponent(new ComponentName("dk.aau.cs.giraf.pictosearch", "dk.aau.cs.giraf.pictosearch.PictoAdminMain"));
    request.putExtra(PICTO_SEARCH_PURPOSE_TAG, PICTO_SEARCH_SINGLE_TAG);

    // Sends the intent
    startActivityForResult(request, GET_SINGLE_PICTOGRAM);
} catch (Exception e) {

    Toast.makeText(this, "Could not open PictoSearch", Toast.LENGTH_SHORT).show();
}