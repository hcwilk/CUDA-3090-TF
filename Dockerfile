FROM tensorflow/tensorflow:2.13.0-gpu

WORKDIR /tf

RUN pip install --no-cache-dir transformers torch pandas numpy jupyter wget ipykernel

CMD ["jupyter", "notebook", "--notebook-dir=/tf", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
