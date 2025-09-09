#!/bin/zsh

echo "Directorio actual: $NAUTILUS_SCRIPT_CURRENT_URI"
echo "Directorio actual: $(echo "$NAUTILUS_SCRIPT_CURRENT_URI" | sed 's/file:\/\///')"


# Execute Captions WD 14
conda init
conda activate mltesting

python /home/fercho/Proyectos/Tagger/run.py --dir "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"