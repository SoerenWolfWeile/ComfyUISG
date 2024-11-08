@echo off

:: Set BASE_PATH to the directory where the .bat file is executed plus the relative path
set BASE_PATH=%~dp0ComfyUI_portable\ComfyUI_windows_portable\ComfyUI

:: Create directories if they do not exist
mkdir "%BASE_PATH%\custom_nodes"
mkdir "%BASE_PATH%\models\checkpoints"
mkdir "%BASE_PATH%\models\loras"
mkdir "%BASE_PATH%\models\controlnet"
mkdir "%BASE_PATH%\models\ipadapter"
mkdir "%BASE_PATH%\models\clip_vision"

:: Clone GitHub repositories into custom_nodes
echo Cloning repositories into custom_nodes...
cd "%BASE_PATH%\custom_nodes"
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
git clone https://github.com/jags111/efficiency-nodes-comfyui.git
git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git
git clone https://github.com/WASasquatch/was-node-suite-comfyui.git
git clone https://github.com/omar92/ComfyUI-QualityOfLifeSuit_Omar92.git
git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git
git clone https://github.com/sipherxyz/comfyui-art-venture.git
git clone https://github.com/bash-j/mikey_nodes.git
git clone https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git
git clone https://github.com/JPS-GER/ComfyUI_JPS-Nodes.git
git clone https://github.com/hylarucoder/comfyui-copilot.git
git clone https://github.com/rgthree/rgthree-comfy.git
git clone https://github.com/cubiq/ComfyUI_essentials.git
git clone https://github.com/chrisgoringe/cg-use-everywhere.git
git clone https://github.com/comfyanonymous/ComfyUI_TensorRT.git

:: Download model files
echo Downloading model files...

:: Checkpoints
cd "%BASE_PATH%\models\checkpoints"
curl -L -o juggernautXL_v8Rundiffusion.safetensors https://huggingface.co/RunDiffusion/Juggernaut-XL-v8/resolve/main/juggernautXL_v8Rundiffusion.safetensors

:: LoRAs
cd "%BASE_PATH%\models\loras"
curl -L -o zavy-ctsmtrc-sdxl.safetensors https://huggingface.co/habulaj/Cuteisometrictiles/resolve/main/zavy-ctsmtrc-sdxl.safetensors

:: ControlNet
cd "%BASE_PATH%\models\controlnet"
curl -L -o diffusion_pytorch_model.safetensors https://huggingface.co/xinsir/controlnet-union-sdxl-1.0/resolve/main/diffusion_pytorch_model.safetensors

:: IP Adapter
cd "%BASE_PATH%\models\ipadapter"
curl -L -o ip-adapter_sdxl_vit-h.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors

:: CLIP Vision
cd "%BASE_PATH%\models\clip_vision"
curl -L -o CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors https://huggingface.co/laion/CLIP-ViT-H-14-laion2B-s32B-b79K/resolve/main/open_clip_pytorch_model.safetensors

echo All downloads completed.
pause
