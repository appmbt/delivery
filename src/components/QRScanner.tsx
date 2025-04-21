import React from 'react';
import { QrReader } from 'react-qr-reader';

export const QRScanner: React.FC<{ onScan: (data: string | null) => void }> = ({ onScan }) => {
  return (
    <QrReader
      onResult={(result, error) => {
        if (result) {
          onScan(result.getText());
        }
        if (error) {
          console.error(error);
        }
      }}
      constraints={{ facingMode: 'environment' }}
      style={{ width: '100%' }}
    />
  );
};