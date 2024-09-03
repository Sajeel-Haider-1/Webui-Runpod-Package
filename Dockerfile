FROM pytorch/pytorch:2.3.1-cuda11.8-cudnn8-runtime

WORKDIR /webui

RUN apt-get update && apt-get install -y && apt-get install -y wget curl \
    git \ 
    gcc \
    g++ \
    libgl1-mesa-glx
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

WORKDIR /webui/stable-diffusion-webui/models/Stable-diffusion

RUN wget -O yogi_LCM.safetensors "https://civitai.com/api/download/models/262126?type=Model&format=SafeTensor&size=pruned&fp=fp16&token=974c0ca1665c3d69300e67c48574ecdc"

WORKDIR /webui/stable-diffusion-webui/extensions

RUN git clone https://github.com/Mikubill/sd-webui-controlnet.git
RUN git clone https://github.com/huchenlei/sd-webui-openpose-editor.git
RUN git clone https://github.com/Gourieff/sd-webui-reactor.git

WORKDIR /webui/stable-diffusion-webui/extensions/sd-webui-controlnet/models

RUN wget https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_canny.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_depth.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_mlsd.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_normal.pth
RUN wget https://huggingface.co/lllyasviel/ControlNet/resolve/main/models/control_sd15_openpose.pth

WORKDIR /webui/stable-diffusion-webui

RUN conda install xformers -c xformers
RUN pip install -r requirements.txt
RUN pip install torchvision
RUN pip install onnxruntime-gpu
RUN pip install albumentations==1.4.3
RUN pip install insightface==0.7.3
RUN pip install onnx>=1.14.0
RUN conda install glib -y
RUN pip install runpod

COPY webui_handler.py /webui/stable-diffusion-webui/webui_handler.py

CMD ["sh", "-c", "python launch.py --listen --xformers --skip-torch-cuda-test --enable-insecure-extension-access --api --port 3000 & python /webui/stable-diffusion-webui/webui_handler.py"]