export const uploadFileToSharePoint = async (file: File, folderUrl: string, accessToken: string) => {
  const url = `https://<your-sharepoint-site>/_api/web/getfolderbyserverrelativeurl('${folderUrl}')/files/add(overwrite=true, url='${file.name}')`;

  const response = await fetch(url, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${accessToken}`,
      Accept: 'application/json;odata=verbose',
      'Content-Type': file.type,
    },
    body: file,
  });

  if (!response.ok) {
    throw new Error(`Error uploading file: ${response.statusText}`);
  }

  return response.json();
};