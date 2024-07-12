
FROM tensorflow/tensorflow:2.13.0-gpu

WORKDIR /tf

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0

RUN pip install --no-cache-dir transformers torch pandas numpy jupyter wget ipykernel mediapipe opencv-python

CMD ["jupyter", "notebook", "--notebook-dir=/tf", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
