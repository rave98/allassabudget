import { IonTabButton } from '@ionic/react';
import IButtonProps from '../../models/PropsInterfaces/IButtonProps';

const ToolbarButton: React.FC<IButtonProps> = ({text, onClick}) => {
  return (
    <IonTabButton onClick={onClick}> 
      { text }
    </IonTabButton>
  );
};

export default ToolbarButton;
